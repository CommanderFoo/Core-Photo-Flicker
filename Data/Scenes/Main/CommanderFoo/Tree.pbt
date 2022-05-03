Name: "CommanderFoo"
RootId: 9418009343971220056
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
  ParentId: 9418009343971220056
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
