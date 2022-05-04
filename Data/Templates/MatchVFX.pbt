Assets {
  Id: 5023634569369172201
  Name: "MatchVFX"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 1430913640722992373
      Objects {
        Id: 1430913640722992373
        Name: "MatchVFX"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 4781671109827199097
        ChildIds: 15223108780144005887
        ChildIds: 3486621954749763735
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
        Id: 15223108780144005887
        Name: "Paper Burst VFX"
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
        ParentId: 1430913640722992373
        UnregisteredParameters {
          Overrides {
            Name: "bp:Paper Type"
            Int: 1
          }
          Overrides {
            Name: "bp:Radius"
            Float: 0.512094557
          }
          Overrides {
            Name: "bp:Density"
            Float: 0.529805183
          }
          Overrides {
            Name: "bp:Life"
            Float: 0.5
          }
          Overrides {
            Name: "bp:Enable Burning Erode"
            Bool: false
          }
          Overrides {
            Name: "bp:Initial Burn Amount"
            Float: 0.0590042472
          }
          Overrides {
            Name: "bp:Radial Velocity Min"
            Float: 5
          }
          Overrides {
            Name: "bp:Radial Velocity Max"
            Float: 5
          }
          Overrides {
            Name: "bp:Upward Velocity Min"
            Float: 6
          }
          Overrides {
            Name: "bp:Upward Velocity Max"
            Float: 8
          }
          Overrides {
            Name: "bp:Gravity"
            Float: -10
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
        Blueprint {
          BlueprintAsset {
            Id: 6350749773310806995
          }
          TeamSettings {
          }
          Vfx {
            AutoPlay: true
          }
        }
        Relevance {
          Value: "mc:eproxyrelevance:medium"
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
      Objects {
        Id: 3486621954749763735
        Name: "Coin Pickup 02 SFX"
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
        ParentId: 1430913640722992373
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
        AudioInstance {
          AudioAsset {
            Id: 5070547554224574226
          }
          AutoPlay: true
          Pitch: 75
          Volume: 1
          Falloff: -1
          Radius: -1
        }
        NetworkRelevanceDistance {
          Value: "mc:eproxyrelevance:critical"
        }
      }
    }
    Assets {
      Id: 6350749773310806995
      Name: "Paper Burst VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_paper_burst"
      }
    }
    Assets {
      Id: 5070547554224574226
      Name: "Coin Pickup 02 SFX"
      PlatformAssetType: 7
      PrimaryAsset {
        AssetType: "AudioAssetRef"
        AssetId: "sfx_coin_pickup_02_Cue_ref"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 113
}
