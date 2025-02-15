import 'package:bustrackingapp/core/app_export.dart';
import 'package:bustrackingapp/data/apiClient/api_client.dart';
import 'package:bustrackingapp/presentation/add_a_card_active_screen/controller/add_a_card_active_controller.dart';
import 'package:bustrackingapp/presentation/add_a_card_defualt_screen/controller/add_a_card_defualt_controller.dart';
import 'package:bustrackingapp/presentation/add_new_address_screen/controller/add_new_address_controller.dart';
import 'package:bustrackingapp/presentation/app_navigation_screen/controller/app_navigation_controller.dart';
import 'package:bustrackingapp/presentation/bus_routes_screen/controller/bus_routes_controller.dart';
import 'package:bustrackingapp/presentation/edit_address_screen/controller/edit_address_controller.dart';
import 'package:bustrackingapp/presentation/edit_profile_screen/controller/edit_profile_controller.dart';
import 'package:bustrackingapp/presentation/home_container_screen/controller/home_container_controller.dart';
import 'package:bustrackingapp/presentation/home_search_filled_screen/controller/home_search_filled_controller.dart';
import 'package:bustrackingapp/presentation/home_search_screen/controller/home_search_controller.dart';
import 'package:bustrackingapp/presentation/login_error_screen/controller/login_error_controller.dart';
import 'package:bustrackingapp/presentation/login_forgot_password_screen/controller/login_forgot_password_controller.dart';
import 'package:bustrackingapp/presentation/login_screen/controller/login_controller.dart';
import 'package:bustrackingapp/presentation/logout_screen/controller/logout_controller.dart';
import 'package:bustrackingapp/presentation/map_screen/controller/map_controller.dart';
import 'package:bustrackingapp/presentation/my_address_screen/controller/my_address_controller.dart';
import 'package:bustrackingapp/presentation/onboarding_screen_five_screen/controller/onboarding_screen_five_controller.dart';
import 'package:bustrackingapp/presentation/onboarding_screen_six_screen/controller/onboarding_screen_six_controller.dart';
import 'package:bustrackingapp/presentation/password_change_screen/controller/password_change_controller.dart';
import 'package:bustrackingapp/presentation/profile_details_screen/controller/profile_details_controller.dart';
import 'package:bustrackingapp/presentation/recommended_routes_screen/controller/recommended_routes_controller.dart';
import 'package:bustrackingapp/presentation/reset_password_screen/controller/reset_password_controller.dart';
import 'package:bustrackingapp/presentation/share_ride_screen/controller/share_ride_controller.dart';
import 'package:bustrackingapp/presentation/sign_up_screen/controller/sign_up_controller.dart';
import 'package:bustrackingapp/presentation/ticket_screen/controller/ticket_controller.dart';
import 'package:bustrackingapp/presentation/verification_screen/controller/verification_controller.dart';
import 'package:bustrackingapp/presentation/my_address_delete_screen/controller/my_address_delete_controller.dart';
import 'package:bustrackingapp/presentation/my_address_edit_delete_screen/controller/my_address_edit_delete_controller.dart';
import 'package:bustrackingapp/presentation/onboarding_screen_four_screen/controller/onboarding_screen_four_controller.dart';
import 'package:bustrackingapp/presentation/splash_screen_one_screen/controller/splash_screen_one_controller.dart';
import 'package:bustrackingapp/presentation/verification_error_screen/controller/verification_error_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    // Connectivity connectivity = Connectivity();
    // Get.put(NetworkInfo(connectivity));

    Get.lazyPut(() => SplashScreenOneController());
    Get.lazyPut(() => OnboardingScreenFourController());
    Get.lazyPut(() => OnboardingScreenFiveController());
    Get.lazyPut(() => OnboardingScreenSixController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginErrorController());
    Get.lazyPut(() => LoginForgotPasswordController());
    Get.lazyPut(() => VerificationController());
    Get.lazyPut(() => VerificationErrorController());
    Get.lazyPut(() => ResetPasswordController());
    Get.lazyPut(() => PasswordChangeController());
    Get.lazyPut(() => HomeContainerController());
    Get.lazyPut(() => HomeSearchController());
    Get.lazyPut(() => HomeSearchFilledController());
    Get.lazyPut(() => RecommendedRoutesController());
    Get.lazyPut(() => BusRoutesController());
    Get.lazyPut(() => MapController());
    Get.lazyPut(() => ShareRideController());
    Get.lazyPut(() => TicketController());


    Get.lazyPut(() => ProfileDetailsController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => AddACardDefualtController());
    Get.lazyPut(() => AddACardActiveController());
    Get.lazyPut(() => AddNewAddressController());
    Get.lazyPut(() => MyAddressController());
    Get.lazyPut(() => MyAddressEditDeleteController());
    Get.lazyPut(() => EditAddressController());
    Get.lazyPut(() => MyAddressDeleteController());
    Get.lazyPut(() => LogoutController());
    Get.lazyPut(() => AppNavigationController());
  }
}
