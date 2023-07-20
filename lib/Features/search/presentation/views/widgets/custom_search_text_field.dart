import 'package:booklyapp/Features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomSearchTextField extends StatelessWidget {
 CustomSearchTextField({Key? key,  }) : super(key: key);
 String ?input;
 TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller,
      cursorColor: Colors.white,
    onChanged: (text){
        input=text;
        if(input=='')
          {
            controller.clear();
          }
        BlocProvider.of<SearchCubit>(context).fetchSearchResults(input ?? '');



    },
      decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          suffixIcon: IconButton(color: Colors.white,
            onPressed: () {},
            icon:const  Opacity(opacity:0.8 ,
              child:  Icon(
                size: 22,
                FontAwesomeIcons.magnifyingGlass,
              ),
            ),
          ),
          hintText: 'Search'),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12));
  }
}
