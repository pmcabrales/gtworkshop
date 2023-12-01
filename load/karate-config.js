function fn() {
    //Read base configurations
    var configFun = read('classpath:gw/gtapi/util/testsconfig/gw-config-utils.js');
    var config = configFun();

    //Configure AUT URLs
    config.bcBaseUrl = java.lang.System.getenv('bcBaseUrl') ? java.lang.System.getenv('bcBaseUrl').trim() : 'DEFAULT_BC_URL';
    config.ccBaseUrl = java.lang.System.getenv('ccBaseUrl') ? java.lang.System.getenv('ccBaseUrl').trim() : 'DEFAULT_CC_URL';
    config.cmBaseUrl = java.lang.System.getenv('cmBaseUrl') ? java.lang.System.getenv('cmBaseUrl').trim() : 'DEFAULT_CM_URL';
    config.pcBaseUrl = java.lang.System.getenv('pcBaseUrl') ? java.lang.System.getenv('pcBaseUrl').trim() : 'DEFAULT_PC_URL';

    // Override karate feature files root dir location.
    config.execution.setKarateFeatureDirLocation("classpath:actions");

    return config;
}
