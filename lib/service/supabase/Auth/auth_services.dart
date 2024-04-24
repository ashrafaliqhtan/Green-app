part of 'supabase_services.dart';

//----------------------------- Auth --------------------------------
class AuthServices extends DBServices {
  Future signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final signedInUser =
        await supabase.auth.signUp(email: email, password: password);

    await supabase.from("user_green_sa_app").insert(
        {'id_user': signedInUser.user!.id, 'name': name, 'phone': phone});
  }

  Future login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future signOut() async {
    await supabase.auth.signOut();
  }

  Future<Session?> getCurrentSession() async {
    final currentSession = supabase.auth.currentSession;

    return currentSession;
  }

  Future<GSIUser> getUser({required String id}) async {
    final userInfo = await supabase
        .from('user_green_sa_app')
        .select('*')
        .match({'id_user': id}).single();
    email = supabase.auth.currentUser!.email!;
    return GSIUser.fromJson(userInfo);
  }

  Future updateUser(
      {required String name,
      required String phone,
      required String city}) async {
    try {
      await supabase
          .from('user_green_sa_app')
          .update({'name': name, 'phone': phone, 'city': city})
          .eq('id_user', userID)
          .single();
    } catch (_) {}
  }

  Future<String> getCurrentUserId() async {
    final userId = supabase.auth.currentUser!.id;

    return userId;
  }

  Future sendOtp({required String email}) async {
    await supabase.auth.signInWithOtp(email: email);
  }

  Future verifyOtp({required String email, required String otpToken}) async {
    await supabase.auth
        .verifyOTP(token: otpToken, type: OtpType.email, email: email);
  }

  Future resendOtp() async {
    email = supabase.auth.currentSession!.user.email!;
    await supabase.auth
        .resend(type: OtpType.magiclink, email: "flutterg73@gmail.com");
  }

  Future resetPassword({required String newPassword}) async {
    await supabase.auth.updateUser(UserAttributes(password: newPassword));
  }
}
