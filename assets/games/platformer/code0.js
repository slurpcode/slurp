gdjs.New_32sceneCode = {};
gdjs.New_32sceneCode.GDPlayerObjects1_1final = [];

gdjs.New_32sceneCode.forEachCount0_3 = 0;

gdjs.New_32sceneCode.forEachCount1_3 = 0;

gdjs.New_32sceneCode.forEachIndex3 = 0;

gdjs.New_32sceneCode.forEachObjects3 = [];

gdjs.New_32sceneCode.forEachTotalCount3 = 0;

gdjs.New_32sceneCode.GDPlayerObjects1= [];
gdjs.New_32sceneCode.GDPlayerObjects2= [];
gdjs.New_32sceneCode.GDPlayerObjects3= [];
gdjs.New_32sceneCode.GDPlatformObjects1= [];
gdjs.New_32sceneCode.GDPlatformObjects2= [];
gdjs.New_32sceneCode.GDPlatformObjects3= [];
gdjs.New_32sceneCode.GDJumpthruObjects1= [];
gdjs.New_32sceneCode.GDJumpthruObjects2= [];
gdjs.New_32sceneCode.GDJumpthruObjects3= [];
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects1= [];
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects2= [];
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects3= [];
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects1= [];
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects2= [];
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects3= [];
gdjs.New_32sceneCode.GDMovingPlatformObjects1= [];
gdjs.New_32sceneCode.GDMovingPlatformObjects2= [];
gdjs.New_32sceneCode.GDMovingPlatformObjects3= [];
gdjs.New_32sceneCode.GDGoLeftObjects1= [];
gdjs.New_32sceneCode.GDGoLeftObjects2= [];
gdjs.New_32sceneCode.GDGoLeftObjects3= [];
gdjs.New_32sceneCode.GDGoRightObjects1= [];
gdjs.New_32sceneCode.GDGoRightObjects2= [];
gdjs.New_32sceneCode.GDGoRightObjects3= [];
gdjs.New_32sceneCode.GDLadderObjects1= [];
gdjs.New_32sceneCode.GDLadderObjects2= [];
gdjs.New_32sceneCode.GDLadderObjects3= [];
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1= [];
gdjs.New_32sceneCode.GDPlayerHitBoxObjects2= [];
gdjs.New_32sceneCode.GDPlayerHitBoxObjects3= [];
gdjs.New_32sceneCode.GDSlimeWalkObjects1= [];
gdjs.New_32sceneCode.GDSlimeWalkObjects2= [];
gdjs.New_32sceneCode.GDSlimeWalkObjects3= [];
gdjs.New_32sceneCode.GDFlyObjects1= [];
gdjs.New_32sceneCode.GDFlyObjects2= [];
gdjs.New_32sceneCode.GDFlyObjects3= [];
gdjs.New_32sceneCode.GDCloudObjects1= [];
gdjs.New_32sceneCode.GDCloudObjects2= [];
gdjs.New_32sceneCode.GDCloudObjects3= [];
gdjs.New_32sceneCode.GDBackgroundObjectsObjects1= [];
gdjs.New_32sceneCode.GDBackgroundObjectsObjects2= [];
gdjs.New_32sceneCode.GDBackgroundObjectsObjects3= [];
gdjs.New_32sceneCode.GDScoreObjects1= [];
gdjs.New_32sceneCode.GDScoreObjects2= [];
gdjs.New_32sceneCode.GDScoreObjects3= [];
gdjs.New_32sceneCode.GDCoinObjects1= [];
gdjs.New_32sceneCode.GDCoinObjects2= [];
gdjs.New_32sceneCode.GDCoinObjects3= [];
gdjs.New_32sceneCode.GDCoinIconObjects1= [];
gdjs.New_32sceneCode.GDCoinIconObjects2= [];
gdjs.New_32sceneCode.GDCoinIconObjects3= [];
gdjs.New_32sceneCode.GDLeftButtonObjects1= [];
gdjs.New_32sceneCode.GDLeftButtonObjects2= [];
gdjs.New_32sceneCode.GDLeftButtonObjects3= [];
gdjs.New_32sceneCode.GDRightButtonObjects1= [];
gdjs.New_32sceneCode.GDRightButtonObjects2= [];
gdjs.New_32sceneCode.GDRightButtonObjects3= [];
gdjs.New_32sceneCode.GDJumpButtonObjects1= [];
gdjs.New_32sceneCode.GDJumpButtonObjects2= [];
gdjs.New_32sceneCode.GDJumpButtonObjects3= [];
gdjs.New_32sceneCode.GDArrowButtonsBgObjects1= [];
gdjs.New_32sceneCode.GDArrowButtonsBgObjects2= [];
gdjs.New_32sceneCode.GDArrowButtonsBgObjects3= [];

gdjs.New_32sceneCode.conditionTrue_0 = {val:false};
gdjs.New_32sceneCode.condition0IsTrue_0 = {val:false};
gdjs.New_32sceneCode.condition1IsTrue_0 = {val:false};
gdjs.New_32sceneCode.condition2IsTrue_0 = {val:false};
gdjs.New_32sceneCode.condition3IsTrue_0 = {val:false};
gdjs.New_32sceneCode.conditionTrue_1 = {val:false};
gdjs.New_32sceneCode.condition0IsTrue_1 = {val:false};
gdjs.New_32sceneCode.condition1IsTrue_1 = {val:false};
gdjs.New_32sceneCode.condition2IsTrue_1 = {val:false};
gdjs.New_32sceneCode.condition3IsTrue_1 = {val:false};


gdjs.New_32sceneCode.eventsList0x688fcc = function(runtimeScene) {

{

gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.createFrom(gdjs.New_32sceneCode.GDPlayerHitBoxObjects1);


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length;i<l;++i) {
    if ( !(gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i].getBehavior("PlatformerObject").isMoving()) ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects2.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects2[i].setAnimation(0);
}
}}

}


{

/* Reuse gdjs.New_32sceneCode.GDPlayerHitBoxObjects1 */

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").isMoving() ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].setAnimation(2);
}
}}

}


}; //End of gdjs.New_32sceneCode.eventsList0x688fcc
gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoLeftObjects1Objects = Hashtable.newFrom({"GoLeft": gdjs.New_32sceneCode.GDGoLeftObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDMovingPlatformObjects1Objects = Hashtable.newFrom({"MovingPlatform": gdjs.New_32sceneCode.GDMovingPlatformObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoRightObjects1Objects = Hashtable.newFrom({"GoRight": gdjs.New_32sceneCode.GDGoRightObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDMovingPlatformObjects1Objects = Hashtable.newFrom({"MovingPlatform": gdjs.New_32sceneCode.GDMovingPlatformObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoLeftObjects1Objects = Hashtable.newFrom({"GoLeft": gdjs.New_32sceneCode.GDGoLeftObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects = Hashtable.newFrom({"SlimeWalk": gdjs.New_32sceneCode.GDSlimeWalkObjects1, "Fly": gdjs.New_32sceneCode.GDFlyObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoRightObjects1Objects = Hashtable.newFrom({"GoRight": gdjs.New_32sceneCode.GDGoRightObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects = Hashtable.newFrom({"SlimeWalk": gdjs.New_32sceneCode.GDSlimeWalkObjects1, "Fly": gdjs.New_32sceneCode.GDFlyObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDPlayerHitBoxObjects1Objects = Hashtable.newFrom({"PlayerHitBox": gdjs.New_32sceneCode.GDPlayerHitBoxObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects = Hashtable.newFrom({"SlimeWalk": gdjs.New_32sceneCode.GDSlimeWalkObjects1, "Fly": gdjs.New_32sceneCode.GDFlyObjects1});gdjs.New_32sceneCode.eventsList0x6948d4 = function(runtimeScene) {

}; //End of gdjs.New_32sceneCode.eventsList0x6948d4
gdjs.New_32sceneCode.eventsList0x68c3fc = function(runtimeScene) {

{

/* Reuse gdjs.New_32sceneCode.GDFlyObjects2 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects2 */

gdjs.New_32sceneCode.forEachTotalCount3 = 0;
gdjs.New_32sceneCode.forEachObjects3.length = 0;
gdjs.New_32sceneCode.forEachCount0_3 = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length;
gdjs.New_32sceneCode.forEachTotalCount3 += gdjs.New_32sceneCode.forEachCount0_3;
gdjs.New_32sceneCode.forEachObjects3.push.apply(gdjs.New_32sceneCode.forEachObjects3,gdjs.New_32sceneCode.GDSlimeWalkObjects2);
gdjs.New_32sceneCode.forEachCount1_3 = gdjs.New_32sceneCode.GDFlyObjects2.length;
gdjs.New_32sceneCode.forEachTotalCount3 += gdjs.New_32sceneCode.forEachCount1_3;
gdjs.New_32sceneCode.forEachObjects3.push.apply(gdjs.New_32sceneCode.forEachObjects3,gdjs.New_32sceneCode.GDFlyObjects2);
for(gdjs.New_32sceneCode.forEachIndex3 = 0;gdjs.New_32sceneCode.forEachIndex3 < gdjs.New_32sceneCode.forEachTotalCount3;++gdjs.New_32sceneCode.forEachIndex3) {
gdjs.New_32sceneCode.GDFlyObjects3.length = 0;

gdjs.New_32sceneCode.GDSlimeWalkObjects3.length = 0;


if (gdjs.New_32sceneCode.forEachIndex3 < gdjs.New_32sceneCode.forEachCount0_3) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects3.push(gdjs.New_32sceneCode.forEachObjects3[gdjs.New_32sceneCode.forEachIndex3]);
}
else if (gdjs.New_32sceneCode.forEachIndex3 < gdjs.New_32sceneCode.forEachCount0_3+gdjs.New_32sceneCode.forEachCount1_3) {
    gdjs.New_32sceneCode.GDFlyObjects3.push(gdjs.New_32sceneCode.forEachObjects3[gdjs.New_32sceneCode.forEachIndex3]);
}
if (true) {
{runtimeScene.getVariables().getFromIndex(0).add(50);
}}
}

}


}; //End of gdjs.New_32sceneCode.eventsList0x68c3fc
gdjs.New_32sceneCode.eventsList0x68c2cc = function(runtimeScene) {

{

gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.createFrom(gdjs.New_32sceneCode.GDPlayerHitBoxObjects1);


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i].getBehavior("PlatformerObject").isFalling() ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDFlyObjects2.createFrom(gdjs.New_32sceneCode.GDFlyObjects1);

/* Reuse gdjs.New_32sceneCode.GDPlayerHitBoxObjects2 */
gdjs.New_32sceneCode.GDSlimeWalkObjects2.createFrom(gdjs.New_32sceneCode.GDSlimeWalkObjects1);

{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].setAnimation(1);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].setAnimation(1);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].activateBehavior("PlatformerObject", true);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].activateBehavior("PlatformerObject", true);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getBehavior("PlatformerObject").setGravity(1500);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].getBehavior("PlatformerObject").setGravity(1500);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i].getBehavior("PlatformerObject").setCanJump();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects2[i].getBehavior("PlatformerObject").simulateJumpKey();
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "jump.wav", false, 100, 1);
}
{ //Subevents
gdjs.New_32sceneCode.eventsList0x68c3fc(runtimeScene);} //End of subevents
}

}


{

/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDPlayerHitBoxObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getY() >= (( gdjs.New_32sceneCode.GDFlyObjects1.length === 0 ) ? (( gdjs.New_32sceneCode.GDSlimeWalkObjects1.length === 0 ) ? 0 :gdjs.New_32sceneCode.GDSlimeWalkObjects1[0].getPointY("")) :gdjs.New_32sceneCode.GDFlyObjects1[0].getPointY("")) - (gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getHeight()) + (( gdjs.New_32sceneCode.GDFlyObjects1.length === 0 ) ? (( gdjs.New_32sceneCode.GDSlimeWalkObjects1.length === 0 ) ? 0 :gdjs.New_32sceneCode.GDSlimeWalkObjects1[0].getHeight()) :gdjs.New_32sceneCode.GDFlyObjects1[0].getHeight()) / 2 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
}

}


}; //End of gdjs.New_32sceneCode.eventsList0x68c2cc
gdjs.New_32sceneCode.eventsList0x68ba1c = function(runtimeScene) {

{

gdjs.New_32sceneCode.GDFlyObjects2.createFrom(gdjs.New_32sceneCode.GDFlyObjects1);

gdjs.New_32sceneCode.GDSlimeWalkObjects2.createFrom(gdjs.New_32sceneCode.GDSlimeWalkObjects1);


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getVariableNumber(gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getVariables().get("GoingLeft")) == 1 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects2[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects2.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects2[i].getVariableNumber(gdjs.New_32sceneCode.GDFlyObjects2[i].getVariables().get("GoingLeft")) == 1 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects2[k] = gdjs.New_32sceneCode.GDFlyObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects2.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects2 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects2 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].addForce(-(300), 0, 0);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getBehavior("PlatformerObject").simulateLeftKey();
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].getBehavior("PlatformerObject").simulateLeftKey();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].flipX(false);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].flipX(false);
}
}}

}


{

gdjs.New_32sceneCode.GDFlyObjects2.createFrom(gdjs.New_32sceneCode.GDFlyObjects1);

gdjs.New_32sceneCode.GDSlimeWalkObjects2.createFrom(gdjs.New_32sceneCode.GDSlimeWalkObjects1);


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getVariableNumber(gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getVariables().get("GoingLeft")) == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects2[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects2.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects2[i].getVariableNumber(gdjs.New_32sceneCode.GDFlyObjects2[i].getVariables().get("GoingLeft")) == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects2[k] = gdjs.New_32sceneCode.GDFlyObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects2.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects2 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects2 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].addForce(300, 0, 0);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].getBehavior("PlatformerObject").simulateRightKey();
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].getBehavior("PlatformerObject").simulateRightKey();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects2[i].flipX(true);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects2.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects2[i].flipX(true);
}
}}

}


{



}


{

/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDPlayerHitBoxObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects, false, runtimeScene, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {

{ //Subevents
gdjs.New_32sceneCode.eventsList0x68c2cc(runtimeScene);} //End of subevents
}

}


}; //End of gdjs.New_32sceneCode.eventsList0x68ba1c
gdjs.New_32sceneCode.eventsList0x687d6c = function(runtimeScene) {

{

/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getOpacity() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects1[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects1[i].getOpacity() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects1[k] = gdjs.New_32sceneCode.GDFlyObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].deleteFromScene(runtimeScene);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].deleteFromScene(runtimeScene);
}
}}

}


}; //End of gdjs.New_32sceneCode.eventsList0x687d6c
gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDPlayerHitBoxObjects1Objects = Hashtable.newFrom({"PlayerHitBox": gdjs.New_32sceneCode.GDPlayerHitBoxObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDCoinObjects1Objects = Hashtable.newFrom({"Coin": gdjs.New_32sceneCode.GDCoinObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDLeftButtonObjects1Objects = Hashtable.newFrom({"LeftButton": gdjs.New_32sceneCode.GDLeftButtonObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDRightButtonObjects1Objects = Hashtable.newFrom({"RightButton": gdjs.New_32sceneCode.GDRightButtonObjects1});gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDJumpButtonObjects1Objects = Hashtable.newFrom({"JumpButton": gdjs.New_32sceneCode.GDJumpButtonObjects1});gdjs.New_32sceneCode.eventsList0xb5aa0 = function(runtimeScene) {

{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].hide();
}
}}

}


{


{
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].setPosition((( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length === 0 ) ? 0 :gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[0].getPointX("")) - 12,(( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length === 0 ) ? 0 :gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[0].getPointY("")));
}
}}

}


{



}


{

gdjs.New_32sceneCode.GDPlayerObjects1.length = 0;


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
gdjs.New_32sceneCode.condition1IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.isKeyPressed(runtimeScene, "RShift");
}if ( gdjs.New_32sceneCode.condition0IsTrue_0.val ) {
{
{gdjs.New_32sceneCode.conditionTrue_1 = gdjs.New_32sceneCode.condition1IsTrue_0;
gdjs.New_32sceneCode.GDPlayerObjects1_1final.length = 0;gdjs.New_32sceneCode.condition0IsTrue_1.val = false;
gdjs.New_32sceneCode.condition1IsTrue_1.val = false;
{
gdjs.New_32sceneCode.GDPlayerObjects2.createFrom(runtimeScene.getObjects("Player"));
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerObjects2[i].getAnimation() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_1.val = true;
        gdjs.New_32sceneCode.GDPlayerObjects2[k] = gdjs.New_32sceneCode.GDPlayerObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerObjects2.length = k;if( gdjs.New_32sceneCode.condition0IsTrue_1.val ) {
    gdjs.New_32sceneCode.conditionTrue_1.val = true;
    for(var j = 0, jLen = gdjs.New_32sceneCode.GDPlayerObjects2.length;j<jLen;++j) {
        if ( gdjs.New_32sceneCode.GDPlayerObjects1_1final.indexOf(gdjs.New_32sceneCode.GDPlayerObjects2[j]) === -1 )
            gdjs.New_32sceneCode.GDPlayerObjects1_1final.push(gdjs.New_32sceneCode.GDPlayerObjects2[j]);
    }
}
}
{
gdjs.New_32sceneCode.GDPlayerObjects2.createFrom(runtimeScene.getObjects("Player"));
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerObjects2.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerObjects2[i].getAnimation() == 2 ) {
        gdjs.New_32sceneCode.condition1IsTrue_1.val = true;
        gdjs.New_32sceneCode.GDPlayerObjects2[k] = gdjs.New_32sceneCode.GDPlayerObjects2[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerObjects2.length = k;if( gdjs.New_32sceneCode.condition1IsTrue_1.val ) {
    gdjs.New_32sceneCode.conditionTrue_1.val = true;
    for(var j = 0, jLen = gdjs.New_32sceneCode.GDPlayerObjects2.length;j<jLen;++j) {
        if ( gdjs.New_32sceneCode.GDPlayerObjects1_1final.indexOf(gdjs.New_32sceneCode.GDPlayerObjects2[j]) === -1 )
            gdjs.New_32sceneCode.GDPlayerObjects1_1final.push(gdjs.New_32sceneCode.GDPlayerObjects2[j]);
    }
}
}
{
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(gdjs.New_32sceneCode.GDPlayerObjects1_1final);
}
}
}}
if (gdjs.New_32sceneCode.condition1IsTrue_0.val) {
{gdjs.evtTools.sound.playSound(runtimeScene, "jump.wav", false, 100, 1);
}}

}


{

gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").isJumping() ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].setAnimation(1);
}
}}

}


{

gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").isFalling() ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].setAnimation(1);
}
}}

}


{

gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").isOnFloor() ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[k] = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {

{ //Subevents
gdjs.New_32sceneCode.eventsList0x688fcc(runtimeScene);} //End of subevents
}

}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.isKeyPressed(runtimeScene, "Left");
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].flipX(true);
}
}}

}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.isKeyPressed(runtimeScene, "Right");
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerObjects1[i].flipX(false);
}
}}

}


{



}


{


{
gdjs.New_32sceneCode.GDPlayerObjects1.createFrom(runtimeScene.getObjects("Player"));
{gdjs.evtTools.camera.setCameraX(runtimeScene, (( gdjs.New_32sceneCode.GDPlayerObjects1.length === 0 ) ? 0 :gdjs.New_32sceneCode.GDPlayerObjects1[0].getPointX("")), "", 0);
}}

}


{



}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDGoLeftObjects1.createFrom(runtimeScene.getObjects("GoLeft"));
gdjs.New_32sceneCode.GDGoRightObjects1.createFrom(runtimeScene.getObjects("GoRight"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDGoLeftObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDGoLeftObjects1[i].hide();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDGoRightObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDGoRightObjects1[i].hide();
}
}}

}


{

gdjs.New_32sceneCode.GDGoLeftObjects1.createFrom(runtimeScene.getObjects("GoLeft"));
gdjs.New_32sceneCode.GDMovingPlatformObjects1.createFrom(runtimeScene.getObjects("MovingPlatform"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoLeftObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDMovingPlatformObjects1Objects, false, runtimeScene, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDMovingPlatformObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDMovingPlatformObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDMovingPlatformObjects1[i].clearForces();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDMovingPlatformObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDMovingPlatformObjects1[i].addForce(-(150), 0, 1);
}
}}

}


{

gdjs.New_32sceneCode.GDGoRightObjects1.createFrom(runtimeScene.getObjects("GoRight"));
gdjs.New_32sceneCode.GDMovingPlatformObjects1.createFrom(runtimeScene.getObjects("MovingPlatform"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoRightObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDMovingPlatformObjects1Objects, false, runtimeScene, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDMovingPlatformObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDMovingPlatformObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDMovingPlatformObjects1[i].clearForces();
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDMovingPlatformObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDMovingPlatformObjects1[i].addForce(150, 0, 1);
}
}}

}


{



}


{



}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDFlyObjects1.createFrom(runtimeScene.getObjects("Fly"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].activateBehavior("PlatformerObject", false);
}
}}

}


{



}


{

gdjs.New_32sceneCode.GDFlyObjects1.createFrom(runtimeScene.getObjects("Fly"));
gdjs.New_32sceneCode.GDGoLeftObjects1.createFrom(runtimeScene.getObjects("GoLeft"));
gdjs.New_32sceneCode.GDSlimeWalkObjects1.createFrom(runtimeScene.getObjects("SlimeWalk"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoLeftObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects, false, runtimeScene, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].returnVariable(gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getVariables().get("GoingLeft")).setNumber(1);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].returnVariable(gdjs.New_32sceneCode.GDFlyObjects1[i].getVariables().get("GoingLeft")).setNumber(1);
}
}}

}


{

gdjs.New_32sceneCode.GDFlyObjects1.createFrom(runtimeScene.getObjects("Fly"));
gdjs.New_32sceneCode.GDGoRightObjects1.createFrom(runtimeScene.getObjects("GoRight"));
gdjs.New_32sceneCode.GDSlimeWalkObjects1.createFrom(runtimeScene.getObjects("SlimeWalk"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDGoRightObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDSlimeWalkObjects1ObjectsGDgdjs_46New_9532sceneCode_46GDFlyObjects1Objects, false, runtimeScene, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].returnVariable(gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getVariables().get("GoingLeft")).setNumber(0);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].returnVariable(gdjs.New_32sceneCode.GDFlyObjects1[i].getVariables().get("GoingLeft")).setNumber(0);
}
}}

}


{

gdjs.New_32sceneCode.GDFlyObjects1.createFrom(runtimeScene.getObjects("Fly"));
gdjs.New_32sceneCode.GDSlimeWalkObjects1.createFrom(runtimeScene.getObjects("SlimeWalk"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getAnimation() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects1[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects1[i].getAnimation() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects1[k] = gdjs.New_32sceneCode.GDFlyObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {

{ //Subevents
gdjs.New_32sceneCode.eventsList0x68ba1c(runtimeScene);} //End of subevents
}

}


{



}


{

gdjs.New_32sceneCode.GDFlyObjects1.createFrom(runtimeScene.getObjects("Fly"));
gdjs.New_32sceneCode.GDSlimeWalkObjects1.createFrom(runtimeScene.getObjects("SlimeWalk"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
gdjs.New_32sceneCode.condition1IsTrue_0.val = false;
gdjs.New_32sceneCode.condition2IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getAnimation() == 1 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects1[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects1[i].getAnimation() == 1 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects1[k] = gdjs.New_32sceneCode.GDFlyObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects1.length = k;}if ( gdjs.New_32sceneCode.condition0IsTrue_0.val ) {
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getBehavior("PlatformerObject").isOnFloor() ) {
        gdjs.New_32sceneCode.condition1IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects1[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDFlyObjects1[i].getBehavior("PlatformerObject").isOnFloor() ) {
        gdjs.New_32sceneCode.condition1IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects1[k] = gdjs.New_32sceneCode.GDFlyObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects1.length = k;}if ( gdjs.New_32sceneCode.condition1IsTrue_0.val ) {
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length;i<l;++i) {
    if ( !(gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getBehavior("PlatformerObject").isMoving()) ) {
        gdjs.New_32sceneCode.condition2IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDSlimeWalkObjects1[k] = gdjs.New_32sceneCode.GDSlimeWalkObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = k;for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDFlyObjects1.length;i<l;++i) {
    if ( !(gdjs.New_32sceneCode.GDFlyObjects1[i].getBehavior("PlatformerObject").isMoving()) ) {
        gdjs.New_32sceneCode.condition2IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDFlyObjects1[k] = gdjs.New_32sceneCode.GDFlyObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDFlyObjects1.length = k;}}
}
if (gdjs.New_32sceneCode.condition2IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDFlyObjects1 */
/* Reuse gdjs.New_32sceneCode.GDSlimeWalkObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].activateBehavior("PlatformerObject", false);
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].activateBehavior("PlatformerObject", false);
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDSlimeWalkObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].setOpacity(gdjs.New_32sceneCode.GDSlimeWalkObjects1[i].getOpacity() - (50 * gdjs.evtTools.runtimeScene.getElapsedTimeInSeconds(runtimeScene)));
}
for(var i = 0, len = gdjs.New_32sceneCode.GDFlyObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDFlyObjects1[i].setOpacity(gdjs.New_32sceneCode.GDFlyObjects1[i].getOpacity() - (50 * gdjs.evtTools.runtimeScene.getElapsedTimeInSeconds(runtimeScene)));
}
}
{ //Subevents
gdjs.New_32sceneCode.eventsList0x687d6c(runtimeScene);} //End of subevents
}

}


{



}


{



}


{

gdjs.New_32sceneCode.GDCoinObjects1.createFrom(runtimeScene.getObjects("Coin"));
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
gdjs.New_32sceneCode.condition1IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.object.hitBoxesCollisionTest(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDPlayerHitBoxObjects1Objects, gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDCoinObjects1Objects, false, runtimeScene, false);
}if ( gdjs.New_32sceneCode.condition0IsTrue_0.val ) {
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDCoinObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDCoinObjects1[i].getOpacity() == 255 ) {
        gdjs.New_32sceneCode.condition1IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDCoinObjects1[k] = gdjs.New_32sceneCode.GDCoinObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDCoinObjects1.length = k;}}
if (gdjs.New_32sceneCode.condition1IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDCoinObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDCoinObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDCoinObjects1[i].setOpacity(254);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "coin.wav", false, 100, 1);
}{runtimeScene.getVariables().getFromIndex(0).add(100);
}}

}


{

gdjs.New_32sceneCode.GDCoinObjects1.createFrom(runtimeScene.getObjects("Coin"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDCoinObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDCoinObjects1[i].getOpacity() < 255 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDCoinObjects1[k] = gdjs.New_32sceneCode.GDCoinObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDCoinObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDCoinObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDCoinObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDCoinObjects1[i].setOpacity(gdjs.New_32sceneCode.GDCoinObjects1[i].getOpacity() - (255 * gdjs.evtTools.runtimeScene.getElapsedTimeInSeconds(runtimeScene)));
}
}{for(var i = 0, len = gdjs.New_32sceneCode.GDCoinObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDCoinObjects1[i].addForce(0, -(30), 0);
}
}}

}


{

gdjs.New_32sceneCode.GDCoinObjects1.createFrom(runtimeScene.getObjects("Coin"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
for(var i = 0, k = 0, l = gdjs.New_32sceneCode.GDCoinObjects1.length;i<l;++i) {
    if ( gdjs.New_32sceneCode.GDCoinObjects1[i].getOpacity() == 0 ) {
        gdjs.New_32sceneCode.condition0IsTrue_0.val = true;
        gdjs.New_32sceneCode.GDCoinObjects1[k] = gdjs.New_32sceneCode.GDCoinObjects1[i];
        ++k;
    }
}
gdjs.New_32sceneCode.GDCoinObjects1.length = k;}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
/* Reuse gdjs.New_32sceneCode.GDCoinObjects1 */
{for(var i = 0, len = gdjs.New_32sceneCode.GDCoinObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDCoinObjects1[i].deleteFromScene(runtimeScene);
}
}}

}


{



}


{



}


{


{
gdjs.New_32sceneCode.GDScoreObjects1.createFrom(runtimeScene.getObjects("Score"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDScoreObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDScoreObjects1[i].setString("x " + gdjs.evtTools.common.toString(gdjs.evtTools.common.getVariableNumber(runtimeScene.getVariables().getFromIndex(0))));
}
}}

}


{



}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = !(gdjs.evtTools.systemInfo.isMobile());
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDArrowButtonsBgObjects1.createFrom(runtimeScene.getObjects("ArrowButtonsBg"));
gdjs.New_32sceneCode.GDJumpButtonObjects1.createFrom(runtimeScene.getObjects("JumpButton"));
gdjs.New_32sceneCode.GDLeftButtonObjects1.createFrom(runtimeScene.getObjects("LeftButton"));
gdjs.New_32sceneCode.GDRightButtonObjects1.createFrom(runtimeScene.getObjects("RightButton"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDLeftButtonObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDLeftButtonObjects1[i].hide();
}
for(var i = 0, len = gdjs.New_32sceneCode.GDRightButtonObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDRightButtonObjects1[i].hide();
}
for(var i = 0, len = gdjs.New_32sceneCode.GDJumpButtonObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDJumpButtonObjects1[i].hide();
}
for(var i = 0, len = gdjs.New_32sceneCode.GDArrowButtonsBgObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDArrowButtonsBgObjects1[i].hide();
}
}}

}


{


gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
{gdjs.evtTools.input.touchSimulateMouse(runtimeScene, false);
}}

}


{

gdjs.New_32sceneCode.GDLeftButtonObjects1.createFrom(runtimeScene.getObjects("LeftButton"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDLeftButtonObjects1Objects, runtimeScene, true, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").simulateLeftKey();
}
}}

}


{

gdjs.New_32sceneCode.GDRightButtonObjects1.createFrom(runtimeScene.getObjects("RightButton"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDRightButtonObjects1Objects, runtimeScene, true, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").simulateRightKey();
}
}}

}


{

gdjs.New_32sceneCode.GDJumpButtonObjects1.createFrom(runtimeScene.getObjects("JumpButton"));

gdjs.New_32sceneCode.condition0IsTrue_0.val = false;
{
gdjs.New_32sceneCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.New_32sceneCode.mapOfGDgdjs_46New_9532sceneCode_46GDJumpButtonObjects1Objects, runtimeScene, true, false);
}if (gdjs.New_32sceneCode.condition0IsTrue_0.val) {
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.createFrom(runtimeScene.getObjects("PlayerHitBox"));
{for(var i = 0, len = gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length ;i < len;++i) {
    gdjs.New_32sceneCode.GDPlayerHitBoxObjects1[i].getBehavior("PlatformerObject").simulateJumpKey();
}
}}

}


}; //End of gdjs.New_32sceneCode.eventsList0xb5aa0


gdjs.New_32sceneCode.func = function(runtimeScene) {
runtimeScene.getOnceTriggers().startNewFrame();

gdjs.New_32sceneCode.GDPlayerObjects1.length = 0;
gdjs.New_32sceneCode.GDPlayerObjects2.length = 0;
gdjs.New_32sceneCode.GDPlayerObjects3.length = 0;
gdjs.New_32sceneCode.GDPlatformObjects1.length = 0;
gdjs.New_32sceneCode.GDPlatformObjects2.length = 0;
gdjs.New_32sceneCode.GDPlatformObjects3.length = 0;
gdjs.New_32sceneCode.GDJumpthruObjects1.length = 0;
gdjs.New_32sceneCode.GDJumpthruObjects2.length = 0;
gdjs.New_32sceneCode.GDJumpthruObjects3.length = 0;
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects1.length = 0;
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects2.length = 0;
gdjs.New_32sceneCode.GDTiledGrassPlatformObjects3.length = 0;
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects1.length = 0;
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects2.length = 0;
gdjs.New_32sceneCode.GDTiledCastlePlatformObjects3.length = 0;
gdjs.New_32sceneCode.GDMovingPlatformObjects1.length = 0;
gdjs.New_32sceneCode.GDMovingPlatformObjects2.length = 0;
gdjs.New_32sceneCode.GDMovingPlatformObjects3.length = 0;
gdjs.New_32sceneCode.GDGoLeftObjects1.length = 0;
gdjs.New_32sceneCode.GDGoLeftObjects2.length = 0;
gdjs.New_32sceneCode.GDGoLeftObjects3.length = 0;
gdjs.New_32sceneCode.GDGoRightObjects1.length = 0;
gdjs.New_32sceneCode.GDGoRightObjects2.length = 0;
gdjs.New_32sceneCode.GDGoRightObjects3.length = 0;
gdjs.New_32sceneCode.GDLadderObjects1.length = 0;
gdjs.New_32sceneCode.GDLadderObjects2.length = 0;
gdjs.New_32sceneCode.GDLadderObjects3.length = 0;
gdjs.New_32sceneCode.GDPlayerHitBoxObjects1.length = 0;
gdjs.New_32sceneCode.GDPlayerHitBoxObjects2.length = 0;
gdjs.New_32sceneCode.GDPlayerHitBoxObjects3.length = 0;
gdjs.New_32sceneCode.GDSlimeWalkObjects1.length = 0;
gdjs.New_32sceneCode.GDSlimeWalkObjects2.length = 0;
gdjs.New_32sceneCode.GDSlimeWalkObjects3.length = 0;
gdjs.New_32sceneCode.GDFlyObjects1.length = 0;
gdjs.New_32sceneCode.GDFlyObjects2.length = 0;
gdjs.New_32sceneCode.GDFlyObjects3.length = 0;
gdjs.New_32sceneCode.GDCloudObjects1.length = 0;
gdjs.New_32sceneCode.GDCloudObjects2.length = 0;
gdjs.New_32sceneCode.GDCloudObjects3.length = 0;
gdjs.New_32sceneCode.GDBackgroundObjectsObjects1.length = 0;
gdjs.New_32sceneCode.GDBackgroundObjectsObjects2.length = 0;
gdjs.New_32sceneCode.GDBackgroundObjectsObjects3.length = 0;
gdjs.New_32sceneCode.GDScoreObjects1.length = 0;
gdjs.New_32sceneCode.GDScoreObjects2.length = 0;
gdjs.New_32sceneCode.GDScoreObjects3.length = 0;
gdjs.New_32sceneCode.GDCoinObjects1.length = 0;
gdjs.New_32sceneCode.GDCoinObjects2.length = 0;
gdjs.New_32sceneCode.GDCoinObjects3.length = 0;
gdjs.New_32sceneCode.GDCoinIconObjects1.length = 0;
gdjs.New_32sceneCode.GDCoinIconObjects2.length = 0;
gdjs.New_32sceneCode.GDCoinIconObjects3.length = 0;
gdjs.New_32sceneCode.GDLeftButtonObjects1.length = 0;
gdjs.New_32sceneCode.GDLeftButtonObjects2.length = 0;
gdjs.New_32sceneCode.GDLeftButtonObjects3.length = 0;
gdjs.New_32sceneCode.GDRightButtonObjects1.length = 0;
gdjs.New_32sceneCode.GDRightButtonObjects2.length = 0;
gdjs.New_32sceneCode.GDRightButtonObjects3.length = 0;
gdjs.New_32sceneCode.GDJumpButtonObjects1.length = 0;
gdjs.New_32sceneCode.GDJumpButtonObjects2.length = 0;
gdjs.New_32sceneCode.GDJumpButtonObjects3.length = 0;
gdjs.New_32sceneCode.GDArrowButtonsBgObjects1.length = 0;
gdjs.New_32sceneCode.GDArrowButtonsBgObjects2.length = 0;
gdjs.New_32sceneCode.GDArrowButtonsBgObjects3.length = 0;

gdjs.New_32sceneCode.eventsList0xb5aa0(runtimeScene);
return;

}
gdjs['New_32sceneCode'] = gdjs.New_32sceneCode;
