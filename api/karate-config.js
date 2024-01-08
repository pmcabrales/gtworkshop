function fn() {
    //Read base configurations
    var configFun = read('classpath:gw/gtapi/util/testsconfig/gw-config-utils.js');
    var config = configFun();

    //Configure AUT URLs
    config.ccBaseUrl = java.lang.System.getenv('ccBaseUrl') ? java.lang.System.getenv('ccBaseUrl') : 'DEFAULT_CC_URL';
    config.pcBaseUrl = java.lang.System.getenv('pcBaseUrl') ? java.lang.System.getenv('pcBaseUrl') : 'DEFAULT_PC_URL';
    //TODO: Specify the URL of the application under test
    config.igBaseUrl = java.lang.System.getenv('igBaseUrl') ? java.lang.System.getenv('igBaseUrl') : 'http://localhost:8080';

    //AUT Instance Healthcheck
    appHealthCheck(config.ccBaseUrl, false);
    appHealthCheck(config.pcBaseUrl, false);

    //Set Basic Auth Header credentials
    config.credentialsUtil.setCredentialsForAuthHeader('su','gw');

    return config;
}