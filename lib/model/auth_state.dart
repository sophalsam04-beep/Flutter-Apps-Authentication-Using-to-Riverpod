class AuthState{
    final bool isloading;
    final bool islogged;
    final String? error;

    const AuthState({
      this.isloading = false,
      this.islogged = false,
      this.error,
    });

    // Copy with
    AuthState copyWith({
      bool? isloading,
      bool? islogged,
      String? error,
    }){
        
        return AuthState(
          isloading: isloading ?? this.isloading,
          islogged: islogged ??  this.islogged,
          error: error,
        );
    }

    
    
}