import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:level_1_task_gdg/core/color.dart';

class ApiTst extends StatelessWidget {
  const ApiTst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.purple),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getProdectResponse(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Text(
                (snapshot.data as Response).data['products'].toString(),
              );
            }
          },
        ),
      ),
    );
  }
}

getProdectResponse() async {
  final Dio dio = Dio();
  Future<Response> response = dio.get('https://dummyjson.com/products');
  return response;
}




// class ApiTst extends StatefulWidget {
//   const ApiTst({super.key});

//   @override
//   State<ApiTst> createState() => _ApiTstState();
// }

// class _ApiTstState extends State<ApiTst> {
//   late Response response;
//   bool isLoading = false;
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   void getData() async {
//     setState(() {
//       isLoading = true;
//     });
//     response = await getProdectResponse();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: AppColor.purple),
//       body: SingleChildScrollView(
//         child:
//             isLoading
//                 ? CircularProgressIndicator()
//                 : Center(
//                   child: Text(
//                     'Tihs is the Data: ${response.data['products'].toString()}',
//                   ),
//                 ),
//       ),
//     );
//   }
// }

// getProdectResponse() async {
//   final Dio dio = Dio();
//   Future<Response> response = dio.get('https://dummyjson.com/products');
//   return response;
// }

