import 'package:buro_employee/sessionmanager/preferences_helper.dart';
import 'package:buro_employee/utilities/constants.dart';

class SessionManager {




  Future<void> createSession(var userdata) async {
    await Future.wait(<Future>[
      setIsLoggedIn(true),

      setUserID(userdata.userId),

    ]);
  }



  Future<bool> get isLoggedIn =>
      PreferencesHelper.getBool(constants.KEY_IS_LOGGED_IN);

  Future setIsLoggedIn(bool value) =>
      PreferencesHelper.setBool(constants.KEY_IS_LOGGED_IN, value);


  Future<String> get userID =>
      PreferencesHelper.getString(constants.KEY_USERID);

  Future setUserID(String value) =>
      PreferencesHelper.setString(constants.KEY_USERID, value);

  Future setCustomerID(int value) =>
      PreferencesHelper.setInt(constants.KEY_CUSTOMER_ID, value);

  Future setIsUpdateDeviceInfoCall(bool value) =>
      PreferencesHelper.setBool(constants.KEY_FIRST_INSTALL, value);

  Future<int> get customerID =>
      PreferencesHelper.getInt(constants.KEY_CUSTOMER_ID);

  Future<bool> get IsUpdateDeviceInfoCall =>
      PreferencesHelper.getBool(constants.KEY_FIRST_INSTALL);


  Future clearCustomerId() =>
      PreferencesHelper.setInt(constants.KEY_CUSTOMER_ID, 0);


Future<String> get password =>
      PreferencesHelper.getString(constants.KEY_PASSWORD);

  Future setPassword(String value) =>
      PreferencesHelper.setString(constants.KEY_PASSWORD, value);

  Future setLang(String value) {
   return  PreferencesHelper.setString(constants.KEY_LANGUAGE, value);

  }

  Future setToken (String value) {

    return  PreferencesHelper.setString(constants.KEY_TOKEN, value);

  }

  Future<String> get selectedLang =>
            PreferencesHelper.getString(constants.KEY_LANGUAGE);


  Future setSupervisorInfo(String value) =>
      PreferencesHelper.setString(constants.KEY_SUPERVISOR_INFO, value);

  Future<String> get supervisorInfo =>
            PreferencesHelper.getString(constants.KEY_SUPERVISOR_INFO);


  Future setSubmoduleId(int value) =>
      PreferencesHelper.setInt(constants.KEY_SUBMODULE_ID, value);

  Future clearSubmoduleId() =>
      PreferencesHelper.setInt(constants.KEY_SUBMODULE_ID, 0);

  Future setCoreFinanceSiteCode(String value) =>
      PreferencesHelper.setString(constants.KEY_CORE_FINANCE_SITE_ID, value);

  Future setGradeID(String value) =>
      PreferencesHelper.setString(constants.KEY_GRADE_ID, value);

  Future clearCoreFinanceSiteCode() =>
      PreferencesHelper.setString(constants.KEY_CORE_FINANCE_SITE_ID, '');
 Future clearGradeID() =>
      PreferencesHelper.setString(constants.KEY_CORE_FINANCE_SITE_ID, '');


  Future<int> get subModuleId =>
            PreferencesHelper.getInt(constants.KEY_SUBMODULE_ID);

  Future<String> get coreFinanceSiteCode =>
      PreferencesHelper.getString(constants.KEY_CORE_FINANCE_SITE_ID);


  Future<String> get gardeID =>
      PreferencesHelper.getString(constants.KEY_GRADE_ID);



  Future setPlanId(int value) =>
      PreferencesHelper.setInt(constants.KEY_PLAN_ID, value);

  Future clearPlanId() =>
      PreferencesHelper.setInt(constants.KEY_PLAN_ID, 0);


  Future<int> get planId =>
            PreferencesHelper.getInt(constants.KEY_PLAN_ID);

 Future<String> get token =>
            PreferencesHelper.getString(constants.KEY_TOKEN);




  Future<void> clearSession() async {
    await Future.wait(<Future>[
      setIsLoggedIn(false),

      setUserID(''),


    ]);
  }


  Future<void> clearPreferences() async {
    final prefs = await PreferencesHelper.prefs;
    await prefs.clear();
    print("Preferences cleared");
  }
}

final sessionManager = SessionManager();

