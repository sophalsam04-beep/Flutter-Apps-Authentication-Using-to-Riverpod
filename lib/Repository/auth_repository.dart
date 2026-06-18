class AuthRepository{
      Future<bool> login(String email, String password)async{
          await Future.delayed(Duration(seconds: 2));

          if(email == "sophal123@gmail.com" && password == "123"){
              return true;
          }

          throw Exception("Invalid credentials...!");

          
      }
}