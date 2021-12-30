import 'package:rent_ready_app/utilities/common_imports.dart';
import 'package:dio/dio.dart';


class ServerException implements Exception {
   String message;
   String statusCode;

   ServerException({this.statusCode, this.message});
}

class CacheException implements Exception {}

errorHandler(error)  {
   if (error is DioError) {
      if (error.type == DioErrorType.RESPONSE ) {
         if(error.response.statusCode == 422) {
            if (error.response.data is Map) {
               throw ServerException(
                   message:error.response.data["message"]?.toString() ??
                       AppStrings.defaulterrormessage,
                   statusCode: error.response.statusCode.toString());
            } else {
               throw ServerException(message: AppStrings.defaulterrormessage, statusCode:error.response?.statusCode?.toString() ?? "");
            }
         } else if(error.response.statusCode == 403){

            throw Exception();

         }else{
            throw ServerException(message:AppStrings.defaulterrormessage , statusCode:error.response?.statusCode?.toString() ?? "");
         }
      } else {
         throw ServerException(message:AppStrings.defaulterrormessage);
      }
   } else {
      throw ServerException(message: AppStrings.defaulterrormessage);
   }
}