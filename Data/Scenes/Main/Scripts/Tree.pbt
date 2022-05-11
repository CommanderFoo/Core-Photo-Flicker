Name: "Scripts"
RootId: 4266750952463575350
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
        SelfId: 841534158063459245
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
      Name: "cs:RestartBtn"
      ObjectReference {
        SelfId: 5653786578758624549
      }
    }
    Overrides {
      Name: "cs:ShuffleBtn"
      ObjectReference {
        SelfId: 3000089781911782631
      }
    }
    Overrides {
      Name: "cs:PauseBtn"
      ObjectReference {
        SelfId: 1136480496198617105
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
      Name: "cs:Congrats_PlayBtn"
      ObjectReference {
        SelfId: 464814696722904432
        SubObjectId: 17179009979562998035
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
