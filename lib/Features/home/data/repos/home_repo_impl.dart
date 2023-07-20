import 'package:booklyapp/Features/home/data/models/BookModel.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo.dart';
import 'package:booklyapp/core/errors/failures.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks()async {
  try {
    var data=await  apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
    List<BookModel>books=[];
    for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
    return right(books);
  }  catch (e)
  {
    if(e is DioException)
    {

      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      var data=await  apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel>books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e)
    {
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
    try {

      var data=await  apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');
      List<BookModel>books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e)
    {
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchResults({required String text})async {
    try {

      var data=await  apiService.get(
          endPoint:
          'volumes?q=$text+intitle');
      List<BookModel>books=[];
      for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e)
    {
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}
