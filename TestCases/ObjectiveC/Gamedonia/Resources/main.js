//------------------------------------------------------------------
//
// JavaScript sample
//
//------------------------------------------------------------------

//
// For a more complete sample, see "JS Watermelon With Me" bundled with cocos2d-iphone
//

// Loads cocos2d, chipmunk constants and helper functions
require("jsb_constants.js");

director = cc.Director.getInstance();
winSize = director.getWinSize();
centerPos = cc.p( winSize.width/2, winSize.height/2 );

//------------------------------------------------------------------
//
// Main Layer
//
//------------------------------------------------------------------
var MainLayer = cc.LayerGradient.extend({
    chain:null,
    next:null,
    // Constructor
    ctor:function () {
        // This is needed when subclassing a native class from JS
        cc.associateWithNative( this, cc.LayerGradient );

        // Initialize the Grandient Layer
        this.init(cc.c4b(0, 0, 0, 255), cc.c4b(0, 128, 255, 255));

        // After initializing, you can add nodes to the GradientLayer
        var hello = cc.LabelTTF.create("Gamedonia (JavaScript)", "Marker Felt", 36);
        this.addChild( hello );
        hello.setPosition( centerPos );

        // Simple Menu

        var item1 = cc.MenuItemFont.create("Launch test cases (see console)", this.onItem1, this);

        // Change size and color of items
        item1.setFontSize( 20 );
        item1.setColor( cc.c3b(192,192,192));

        // create menu with items
        var menu = cc.Menu.create( item1 );
        menu.setPosition( cc.p( winSize.width/2, winSize.height/3) );
        menu.alignItemsHorizontally();
        this.addChild(menu);
    },

    //
    // callbacks
    //

    onEnter:function () {
        // Do something if needed
    },

    onExit:function () {
        // Do something if needed
    },
});

var userProfile = null;
var nick = 'manelix';
var email = 'manelix@gmail.com';
var pass = 'a';
var pass2 = 'b';
var name = 'Manel';
var fb = 'divertap';
var tw = 'manelix2000';
var gc = 'manelix2000';
var fbAccessToken = '';
var twToken = '';
var twTokenSecret = '';
var restoreToken = 'restore_token';
var query = '{\'name\':\'Manel\'}';
var queryEntity = '{\'type\':\'turn-based\'}';
var limit = 50;
var sort = null;
var skip = 0;
var override = true;
var sessionToken = null;
var openuid = gd.OpenUDID.create();
var parchisURL = "/parchis";
var auth = "auth";
var gameId = 'Parchis';
var currentDate = null;
var requestMethod = 'request_method';
var path = 'path';
var contentType = 'text/plain';
var collection = 'Partidas';
var resultData = null;

MainLayer.prototype.onItem1 = function(sender) {
    cc.log('Executing Gamedonia testcases...');
    cc.log('OpenUDID: '+openuid);

    // Main test cases
    cc.log('-------------------------------');
    cc.log('-- Gamedonia Main test cases --');
    cc.log('-------------------------------');
    cc.log('');

    cc.log('-- Gamedonia Initialize --');
    var ok = gd.initGamedonia( gd.API_KEYS_DEVELOPERS_NORMAL );
    if( !ok ) {
        cc.log('*** WARNING: Gamedonia not initialized. Review your keys!');
        cc.log('-- Gamedonia Initialize: KO --');
        cc.log('');
        return;
    }
    else {
        cc.log('-- Gamedonia Initialize: OK --');
        cc.log('');
    }
    
    /*
    cc.log('----------------------');
    cc.log('-- Users test cases --');
    cc.log('----------------------');
    cc.log('');

    this.executeChain([this.createUserWithEmailTestCase,
                        this.createUserWithOpenUDIDTestCase,
                        this.createUserWithGameCenterTestCase,
                        this.loginWithEmailTestCase,
                        this.loginWithOpenUDIDTestCase,
                        this.loginWithGameCenterTestCase,
                        this.loginWithSessionTokenTestCase,
                        this.getMeWithCallbackTestCase,
                        this.getUserWithCallbackTestCase,
                        this.updateWithCallbackTestCase,
                        this.changePasswordWithCallbackTestCase,
                        this.resetPasswordWithCallbackTestCase,
                        this.restorePasswordWithCallbackTestCase,
                        this.searchWithCallbackTestCase,
                        this.logoutWithCallbackTestCase]);
    */

    cc.log('----------------------');
    cc.log('-- Data test cases --');
    cc.log('----------------------');
    cc.log('');


    this.executeChain([this.createUserWithEmailTestCase,
                        this.loginWithEmailTestCase,
                        this.loginWithSessionTokenTestCase,
                        this.searchEntityWithCallbackTestCase,
                        this.createEntityWithCallbackTestCase,
                        this.getEntityWithCallbackTestCase,
                        //this.updateEntityWithCallbackTestCase,
                        this.removeEntityWithCallbackTestCase,
                        this.logoutWithCallbackTestCase]);

    /*
    cc.log('------------------------');
    cc.log('-- Request test cases --');
    cc.log('------------------------');
    cc.log('');

    cc.log('-- Request Initialize --');
    var ok = gd.initRequest( gd.API_KEYS_DEVELOPERS_NORMAL );
    if( !ok ) {
        cc.log('*** WARNING: Request not initialized. Review your keys!');
        cc.log('-- Request Initialize: KO --');
        cc.log('');
        return;
    }
    else {
        cc.log('-- Request Initialize: OK --');
        cc.log('');
    }

    this.executeChain([this.createUserWithEmailTestCase,this.loginWithEmailTestCase,this.loginWithSessionTokenTestCase,
                        this.md5TestCase,
                        this.hmacsha1TestCase,
                        this.currentDateTestCase,
                        this.signTestCase,
                        this.signWithDataTestCase,
                        this.postWithCallbackTestCase,
                        this.postWithAuthAndCallbackTestCase,
                        this.getWithCallbackTestCase,
                        this.putWithCallbackTestCase,
                        this.delWithCallbackTestCase,
                        this.logoutWithCallbackTestCase]);
    */
};
MainLayer.prototype.executeChain = function(fncs) {
    this.chain = fncs;
    this.next = fncs[0];
    this.executeNext();
};
MainLayer.prototype.executeNext = function() {
    if( this.next != null ) {
        this.next();
    }
    else {
        cc.log('Nothing more to execute');
    }
};
MainLayer.prototype.iterateNext = function() {
    var next_ = null;
    for( var i=0;i<this.chain.length;i++){
        if( this.chain[i] == this.next && i<this.chain.length-1 ) {
            next_ = this.chain[i+1];
            break;
        }
    }
    this.next = next_;
    this.executeNext();
};

/////////////////////
// Test cases
/////////////////////

// Request testcases
MainLayer.prototype.md5TestCase = function() {
    cc.log('-- Request.md5 --');
    // Execute backend
    var md5 = gd.Request.getMd5(name);
    cc.log(name+' in md5 is '+md5);
    cc.log('-- Testcase: OK --');
    mainLayer.iterateNext();
};
MainLayer.prototype.hmacsha1TestCase = function() {
    cc.log('-- Request.hmacsha1 --');
    // Execute backend
    var hmacsha1 = gd.Request.getHmacsha1(name);
    cc.log(name+' in hmacsha1 is '+hmacsha1);
    cc.log('-- Testcase: OK --');
    mainLayer.iterateNext();
};
MainLayer.prototype.currentDateTestCase = function() {
    cc.log('-- Request.getCurrentDate --');
    // Execute backend
    currentDate = gd.Request.getCurrentDate();
    cc.log('Current date is '+currentDate);
    cc.log('-- Testcase: OK --');
    mainLayer.iterateNext();
};
MainLayer.prototype.signTestCase = function() {
    cc.log('-- Request.sign --');
    // Execute backend
    var s = gd.Request.sign( gd.API_KEYS_DEVELOPERS_NORMAL,currentDate,requestMethod,path);
    cc.log('Sign is '+s);
    cc.log('-- Testcase: OK --');
    mainLayer.iterateNext();
};
MainLayer.prototype.signWithDataTestCase = function() {
    cc.log('-- Request.signWithData --');
    // Execute backend
    var s = gd.Request.sign( gd.API_KEYS_DEVELOPERS_NORMAL,name,contentType,currentDate,requestMethod,path);
    cc.log('Sign is '+s);
    cc.log('-- Testcase: OK --');
    mainLayer.iterateNext();
};
MainLayer.prototype.postWithAuthAndCallbackTestCase = function() {
    cc.log('-- Request.postWithAuth --');
    // Execute backend
    gd.Request.postWithCallback(parchisURL,name,auth,sessionToken,gameId,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.postWithCallbackTestCase = function() {
    cc.log('-- Request.post --');
    // Execute backend
    gd.Request.postWithCallback(parchisURL,name,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.getWithCallbackTestCase = function() {
    cc.log('-- Request.get --');
    // Execute backend
    gd.Request.getWithCallback(parchisURL,sessionToken,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.putWithCallbackTestCase = function() {
    cc.log('-- Request.put --');
    // Execute backend
    gd.Request.putWithCallback(parchisURL,name,auth,sessionToken,gameId,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.delWithCallbackTestCase = function() {
    cc.log('-- Request.del --');
    // Execute backend
    gd.Request.delWithCallback(parchisURL,this.onSuccessFailureTestCaseEnded);
};

// Data testcases
MainLayer.prototype.createEntityWithCallbackTestCase = function() {
    cc.log('-- Data.createEntity --');
    var data = gd.Dictionary.create();
    data.setValueForKey('Partida','name');
    data.setValueForKey('turn-based','type');
    // Execute backend
    gd.Gamedonia.getData().createWithCallback(collection,data,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.removeEntityWithCallbackTestCase = function() {
    cc.log('-- Data.removeEntity --');
    // Execute backend
    gd.Gamedonia.getData().removeWithCallback(collection,resultData.getValueForKey('_id'),this.onTestCaseEnded);
};
MainLayer.prototype.updateEntityWithCallbackTestCase = function() {
    cc.log('-- Data.updateEntity --');
    // Execute backend
    gd.Gamedonia.getData().updateWithCallback(collection,resultData,override,this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.getEntityWithCallbackTestCase = function() {
    cc.log('-- Data.getEntity --');
    // Execute backend
    gd.Gamedonia.getData().getWithCallback(collection,resultData.getValueForKey('_id'),this.onSuccessFailureTestCaseEnded);
};
MainLayer.prototype.searchEntityWithCallbackTestCase = function() {
    cc.log('-- Data.getEntity --');
    // Execute backend
    gd.Gamedonia.getData().searchWithCallback(collection,queryEntity,limit,sort,skip,this.onSuccessFailureTestCaseEnded);
};

// Users testcases
MainLayer.prototype.searchWithCallbackTestCase = function() {
    cc.log('-- Users.search --');
    // Execute backend
    gd.Gamedonia.getUsers().searchWithCallback(query,limit,sort,skip,this.onUserSearchEnded);
};
MainLayer.prototype.restorePasswordWithCallbackTestCase = function() {
    cc.log('-- Users.restorePassword --');
    // Execute backend
    gd.Gamedonia.getUsers().restorePasswordWithCallback(restoreToken,pass,this.onTestCaseEnded);
};
MainLayer.prototype.resetPasswordWithCallbackTestCase = function() {
    cc.log('-- Users.resetPassword --');
    // Execute backend
    gd.Gamedonia.getUsers().resetPasswordWithCallback(email, this.onTestCaseEnded);
};
MainLayer.prototype.changePasswordWithCallbackTestCase = function() {
    cc.log('-- Users.changePassword --');
    // Execute backend
    gd.Gamedonia.getUsers().changePasswordWithCallback(email,pass,pass2,this.onTestCaseEnded);
};
MainLayer.prototype.updateWithCallbackTestCase = function() {
    cc.log('-- Users.update --');
    // Execute backend
    var newProfileData = gd.Dictionary.create();
    newProfileData.setValueForKey(nick,'apodo');
    gd.Gamedonia.getUsers().updateWithCallback(newProfileData,override,this.onTestCaseEnded);
};
MainLayer.prototype.getMeWithCallbackTestCase = function() {
    cc.log('-- Users.getMe --');
    // Execute backend
    gd.Gamedonia.getUsers().getMeWithCallback(this.onUserGetMeEnded);
};
MainLayer.prototype.getUserWithCallbackTestCase = function() {
    cc.log('-- Users.getUser --');
    // Execute backend
    gd.Gamedonia.getUsers().getWithCallback(userProfile.getId(),this.onUserGetEnded);
};
MainLayer.prototype.logoutWithCallbackTestCase = function() {
    cc.log('-- Users.logout --');
    // Execute backend
    gd.Gamedonia.getUsers().logoutWithCallback(this.onTestCaseEnded);
};
MainLayer.prototype.loginWithTwitterTestCase = function() {
    cc.log('-- Users.loginWithTW --');
    // Execute backend
    gd.Gamedonia.getUsers().loginWithTwitterAndCallback(tw,twTokenSecret,twToken,this.onTestCaseEnded);
};
MainLayer.prototype.loginWithFacebookTestCase = function() {
    cc.log('-- Users.loginWithFB --');
    // Execute backend
    gd.Gamedonia.getUsers().loginWithFacebookAndCallback(fb,fbAccessToken,this.onTestCaseEnded);
};
MainLayer.prototype.loginWithOpenUDIDTestCase = function() {
    cc.log('-- Users.loginWithOpenUID --');
    // Execute backend
    gd.Gamedonia.getUsers().loginWithOpenUDIDAndCallback(this.onTestCaseEnded);
};
MainLayer.prototype.loginWithGameCenterTestCase = function() {
    cc.log('-- Users.loginWithGameCenter --');
    // Execute backend
    gd.Gamedonia.getUsers().loginWithGameCenterIdAndCallback(gc,this.onTestCaseEnded);
};
MainLayer.prototype.createUserWithEmailTestCase = function() {
    cc.log('-- Users.create --');
    var user = gd.createUserWithEmailAndPassword(email,pass);
    var profileData = gd.Dictionary.create();
    profileData.setValueForKey(name,'name');
    user.setProfile(profileData);
 
    // Execute backend
    gd.Gamedonia.getUsers().createWithCallback(user, this.onTestCaseEnded );
};
MainLayer.prototype.createUserWithOpenUDIDTestCase = function() {
    cc.log('-- Users.createWithOpenUDID --');
    var user = gd.createUserWithOpenUDID(openuid);
    var profileData = gd.Dictionary.create();
    profileData.setValueForKey(name,'name');
    user.setProfile(profileData);
 
    // Execute backend
    gd.Gamedonia.getUsers().createWithCallback(user, this.onTestCaseEnded );
};
MainLayer.prototype.createUserWithGameCenterTestCase = function() {
    cc.log('-- Users.createWithGameCenter --');
    var user = gd.createUserWithGameCenterId(gc);
    var profileData = gd.Dictionary.create();
    profileData.setValueForKey(name,'name');
    user.setProfile(profileData);
 
    // Execute backend
    gd.Gamedonia.getUsers().createWithCallback(user, this.onTestCaseEnded );
};
MainLayer.prototype.loginWithEmailTestCase = function() {
    cc.log('-- Users.loginWithEmail --');
    // Execute backend
    gd.Gamedonia.getUsers().loginWithEmailAndCallback(email,pass,this.onTestCaseEnded);
};
MainLayer.prototype.loginWithSessionTokenTestCase = function ()
{
    cc.log('-- Users.loginWithSessionToken --');
    // Execute backend
    sessionToken = gd.Gamedonia.getUsers().getSessionToken();
    gd.Gamedonia.getUsers().loginWithSessionTokenAndCallback(sessionToken,this.onTestCaseEnded);
};

/////////////////////
// Callback methods
/////////////////////
MainLayer.prototype.onTestCaseEnded = function ( result )
{
    cc.log('Test case result: '+result);
    if( result ) {
        cc.log('-- Testcase: OK --');
    }
    else {
        cc.log('-- Testcase: KO -- ***** WARNING *****');
    }
    cc.log('');
    mainLayer.iterateNext();
};
MainLayer.prototype.onSuccessFailureTestCaseEnded = function ( result,o )
{
    cc.log('Test case result: '+result);
    if( result ) {
        resultData = o;
        cc.log('JSON: '+o);
        cc.log('-- Testcase: OK --');
    }
    else {
        if(o) cc.log('Error code: '+o.getCode());
        cc.log('-- Testcase: KO -- ***** WARNING *****');
    }
    cc.log('');
    mainLayer.iterateNext();
};
MainLayer.prototype.onUserGetEnded = function ( result,profile )
{
    cc.log('User get result: '+result+', with profile: '+profile);
    if( result ) {
        cc.log('-- Users.get: OK --');
    }
    else {
        cc.log('-- Users.get: KO -- ***** WARNING *****');
    }
    cc.log('');
    mainLayer.iterateNext();
};

MainLayer.prototype.onUserGetMeEnded = function ( result,profile )
{
    cc.log('User me result: '+result+', with profile: '+profile);
    userProfile = profile;
    if( result ) {
        cc.log('-- Users.me: OK --');
    }
    else {
        cc.log('-- Users.me: KO -- ***** WARNING *****');
    }
    cc.log('');
    mainLayer.iterateNext();
};

MainLayer.prototype.onUserSearchEnded = function ( result,list )
{
    cc.log('User search result: '+result+', with list: '+list);
    if( result ) {
        cc.log('-- Users.search: OK --');
    }
    else {
        cc.log('-- Users.search: KO -- ***** WARNING *****');
    }
    cc.log('');
    mainLayer.iterateNext();
};

//------------------------------------------------------------------
//
// Main entry point
//
//------------------------------------------------------------------

var mainLayer;
function run()
{
    var scene = cc.Scene.create();
    mainLayer = new MainLayer();
    scene.addChild( mainLayer );

    director.runWithScene( scene );
}

run();


