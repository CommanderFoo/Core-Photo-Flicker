Name: "Scripts"
RootId: 4266750952463575350
Objects {
  Id: 15005419163403940117
  Name: "Leaderboard Dependencies"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  TemplateInstance {
    ParameterOverrideMap {
      key: 4193786343402076394
      value {
        Overrides {
          Name: "Name"
          String: "Leaderboard Dependencies"
        }
        Overrides {
          Name: "Position"
          Vector {
          }
        }
        Overrides {
          Name: "Rotation"
          Rotator {
          }
        }
        Overrides {
          Name: "Scale"
          Vector {
            X: 1
            Y: 1
            Z: 1
          }
        }
      }
    }
    TemplateAsset {
      Id: 10671368441034171688
    }
  }
}
Objects {
  Id: 14235134504143602353
  Name: "Leaderboards_README"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 4090730772248055290
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 17109224186771654119
  Name: "Cards"
  Transform {
    Location {
      Z: 0.001
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Folder {
    IsGroup: true
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 2289050116939653390
  Name: "Local"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  ChildIds: 12726823042498111528
  NetworkContext {
    Type: Local
  }
}
Objects {
  Id: 12726823042498111528
  Name: "Create_Photos"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 2289050116939653390
  UnregisteredParameters {
    Overrides {
      Name: "cs:3DPhoto"
      AssetReference {
        Id: 866414950477945831
      }
    }
    Overrides {
      Name: "cs:Tween"
      AssetReference {
        Id: 5010859578220487614
      }
    }
    Overrides {
      Name: "cs:Cards"
      ObjectReference {
        SelfId: 17109224186771654119
      }
    }
    Overrides {
      Name: "cs:Themes"
      AssetReference {
        Id: 1973718304677095829
      }
    }
    Overrides {
      Name: "cs:Timer"
      ObjectReference {
        SelfId: 17214641365037515531
      }
    }
    Overrides {
      Name: "cs:PauseScreen"
      ObjectReference {
      }
    }
    Overrides {
      Name: "cs:VictoryVFX"
      AssetReference {
        Id: 640981643313215282
      }
    }
    Overrides {
      Name: "cs:UINewTimeBox"
      ObjectReference {
        SelfId: 15537437782754505595
        SubObjectId: 4592353684857437976
        InstanceId: 16443359550206853135
        TemplateId: 3859568201331055719
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 622418870921406564
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 15436693484293200163
  Name: "Client"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  ChildIds: 4004225859173045466
  ChildIds: 7258016952844516425
  ChildIds: 6335774691393329276
  Collidable_v2 {
    Value: "mc:ecollisionsetting:forceoff"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:forceoff"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  NetworkContext {
    DetailRelevance {
      Value: "mc:edetaillevel:low"
    }
    MinDetailLevel {
      Value: "mc:edetaillevel:low"
    }
    MaxDetailLevel {
      Value: "mc:edetaillevel:ultra"
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 6335774691393329276
  Name: "Touch_Client"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15436693484293200163
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 7616104734153868454
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 7258016952844516425
  Name: "UIManager_Server"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15436693484293200163
  UnregisteredParameters {
    Overrides {
      Name: "cs:Tween"
      AssetReference {
        Id: 5010859578220487614
      }
    }
    Overrides {
      Name: "cs:UIPanelMainButtons"
      ObjectReference {
        SelfId: 12637012492273057610
      }
    }
    Overrides {
      Name: "cs:RestartBtn"
      ObjectReference {
        SelfId: 5653786578758624549
      }
    }
    Overrides {
      Name: "cs:PauseBtn"
      ObjectReference {
        SelfId: 1136480496198617105
      }
    }
    Overrides {
      Name: "cs:ShuffleBtnSquare"
      ObjectReference {
        SelfId: 1753450900748820850
        SubObjectId: 17822825686792365732
        InstanceId: 13028781604208830405
        TemplateId: 1040408120915274199
      }
    }
    Overrides {
      Name: "cs:PausePanel"
      ObjectReference {
        SelfId: 8645188952599321583
        SubObjectId: 18265977801772457905
        InstanceId: 15708841779342355332
        TemplateId: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:Matches"
      ObjectReference {
        SelfId: 7860828991044101585
      }
    }
    Overrides {
      Name: "cs:CongratPanel"
      ObjectReference {
        SelfId: 17377035325617552668
        SubObjectId: 1818576290713416063
        InstanceId: 16443359550206853135
        TemplateId: 3859568201331055719
      }
    }
    Overrides {
      Name: "cs:CongratPanelTitleBtn"
      ObjectReference {
        SelfId: 6731027836968864159
      }
    }
    Overrides {
      Name: "cs:Congrats_PlayBtn"
      ObjectReference {
        SelfId: 9830906351788122329
      }
    }
    Overrides {
      Name: "cs:RestartBtnSmall"
      ObjectReference {
        SelfId: 3088195229283567644
        SubObjectId: 13184351717956119817
        InstanceId: 15708841779342355332
        TemplateId: 14023288659414186656
        NestedInstanceIds: 9949614083154602174
        OuterTemplateIds: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:ContinueBtnSmall"
      ObjectReference {
        SelfId: 13080923197347410702
        SubObjectId: 7597076911483041071
        InstanceId: 15708841779342355332
        TemplateId: 14119923603966097905
        NestedInstanceIds: 5353234590505029856
        OuterTemplateIds: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:HelptBtnSmall"
      ObjectReference {
        SelfId: 3496935486245004403
        SubObjectId: 7146785217445425719
        InstanceId: 15708841779342355332
        TemplateId: 3381543344473464802
        NestedInstanceIds: 17712255028505201794
        OuterTemplateIds: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:TitleSceenBtnSmall"
      ObjectReference {
        SelfId: 1792260201898276365
        SubObjectId: 16185451386549994482
        InstanceId: 15708841779342355332
        TemplateId: 10128101213007158315
        NestedInstanceIds: 10780757283735670500
        OuterTemplateIds: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:HelpPanel"
      ObjectReference {
        SelfId: 14654174797103109461
        SubObjectId: 1065769718497404668
        InstanceId: 12878029569979075007
        TemplateId: 3903482482837030487
      }
    }
    Overrides {
      Name: "cs:HelpPanelCloseButton"
      ObjectReference {
        SelfId: 4326531356764249401
        SubObjectId: 17986995274466356880
        InstanceId: 12878029569979075007
        TemplateId: 3903482482837030487
      }
    }
    Overrides {
      Name: "cs:Title_PlayBtn"
      ObjectReference {
        SelfId: 2418174281190231112
        SubObjectId: 6067044185211840393
        InstanceId: 16389421210091220024
        TemplateId: 8520288693219612727
      }
    }
    Overrides {
      Name: "cs:Title_Root"
      ObjectReference {
        SelfId: 7895828788752880789
      }
    }
    Overrides {
      Name: "cs:PausePanel_MatchesLeft"
      ObjectReference {
        SelfId: 6246959250755946813
        SubObjectId: 15867733808156970339
        InstanceId: 15708841779342355332
        TemplateId: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:CongratPanelBestTimeBox"
      ObjectReference {
        SelfId: 6879240258815747357
        SubObjectId: 13217141998046538110
        InstanceId: 16443359550206853135
        TemplateId: 3859568201331055719
      }
    }
    Overrides {
      Name: "cs:ToalWinsBox"
      ObjectReference {
        SelfId: 14926634983258709456
        SubObjectId: 2827503420586283443
        InstanceId: 16443359550206853135
        TemplateId: 3859568201331055719
      }
    }
    Overrides {
      Name: "cs:Title_TutBtn"
      ObjectReference {
        SelfId: 4366773479182736341
        SubObjectId: 6067044185211840393
        InstanceId: 7020615236707917277
        TemplateId: 8520288693219612727
      }
    }
    Overrides {
      Name: "cs:Pause_BestTimeBox"
      ObjectReference {
        SelfId: 2031768987582673686
        SubObjectId: 10859973817405814600
        InstanceId: 15708841779342355332
        TemplateId: 5148378255416365230
      }
    }
    Overrides {
      Name: "cs:Title_LB_Btn"
      ObjectReference {
        SelfId: 3339825613732590424
        SubObjectId: 6067044185211840393
        InstanceId: 17180833255887931705
        TemplateId: 8520288693219612727
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 7333528403897020281
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 4004225859173045466
  Name: "Pickup_Photo_Client"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 15436693484293200163
  UnregisteredParameters {
    Overrides {
      Name: "cs:Tween"
      AssetReference {
        Id: 5010859578220487614
      }
    }
    Overrides {
      Name: "cs:Cards"
      ObjectReference {
        SelfId: 17109224186771654119
      }
    }
    Overrides {
      Name: "cs:MatchVFX"
      AssetReference {
        Id: 5023634569369172201
      }
    }
    Overrides {
      Name: "cs:PickupVFX"
      AssetReference {
        Id: 7615709195224845236
      }
    }
  }
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 7141442945707523897
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 1796045870342176057
  Name: "Server"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 4266750952463575350
  ChildIds: 5871003945175551491
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  NetworkContext {
    Type: Server
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
Objects {
  Id: 5871003945175551491
  Name: "Player_Server"
  Transform {
    Location {
    }
    Rotation {
    }
    Scale {
      X: 1
      Y: 1
      Z: 1
    }
  }
  ParentId: 1796045870342176057
  Collidable_v2 {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  Visible_v2 {
    Value: "mc:evisibilitysetting:inheritfromparent"
  }
  CameraCollidable {
    Value: "mc:ecollisionsetting:inheritfromparent"
  }
  EditorIndicatorVisibility {
    Value: "mc:eindicatorvisibility:visiblewhenselected"
  }
  Script {
    ScriptAsset {
      Id: 10374542445853972667
    }
  }
  NetworkRelevanceDistance {
    Value: "mc:eproxyrelevance:critical"
  }
}
