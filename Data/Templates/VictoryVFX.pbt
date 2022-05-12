Assets {
  Id: 640981643313215282
  Name: "VictoryVFX"
  PlatformAssetType: 5
  TemplateAsset {
    ObjectBlock {
      RootId: 2699142179408984703
      Objects {
        Id: 2699142179408984703
        Name: "VictoryVFX"
        Transform {
          Scale {
            X: 1
            Y: 1
            Z: 1
          }
        }
        ParentId: 9680707703392757057
        ChildIds: 4824856313935765962
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
        Id: 4824856313935765962
        Name: "Swirling Paper Ward VFX"
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
        ParentId: 2699142179408984703
        UnregisteredParameters {
          Overrides {
            Name: "bp:Life"
            Float: 12
          }
          Overrides {
            Name: "bp:Density"
            Float: 4
          }
          Overrides {
            Name: "bp:Particle Scale Multiplier"
            Float: 3
          }
          Overrides {
            Name: "bp:Looping"
            Bool: true
          }
          Overrides {
            Name: "bp:Enable Burning Erode"
            Bool: true
          }
          Overrides {
            Name: "bp:Ward Configurations"
            Enum {
              Value: "mc:ewardtypes:newenumerator0"
            }
          }
          Overrides {
            Name: "bp:Enable Flame"
            Bool: false
          }
          Overrides {
            Name: "bp:Stamp Color"
            Color {
              R: 0.00699545396
              G: 0.254151762
              B: 0.693871737
              A: 1
            }
          }
          Overrides {
            Name: "bp:Script Color"
            Color {
              R: 0.591
              G: 0.0350171365
              B: 0.0150713455
              A: 1
            }
          }
          Overrides {
            Name: "bp:Speed High"
            Float: 64
          }
          Overrides {
            Name: "bp:Erode Direction"
            Enum {
              Value: "mc:eerodedirection:3"
            }
          }
          Overrides {
            Name: "bp:Burning Edge Color"
            Color {
              G: 0.0202648621
              B: 0.09
              A: 1
            }
          }
          Overrides {
            Name: "bp:Spherical Velocity"
            Float: 57.1741905
          }
          Overrides {
            Name: "bp:Cylinder Radius Low"
            Float: 40
          }
          Overrides {
            Name: "bp:Cylinder Radius High"
            Float: 124
          }
          Overrides {
            Name: "bp:Cylinder Height"
            Float: 124
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
            Id: 4291834076289556277
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
    }
    Assets {
      Id: 4291834076289556277
      Name: "Swirling Paper Ward VFX"
      PlatformAssetType: 8
      PrimaryAsset {
        AssetType: "VfxBlueprintAssetRef"
        AssetId: "fxbp_paperWard_burst"
      }
    }
    PrimaryAssetId {
      AssetType: "None"
      AssetId: "None"
    }
  }
  SerializationVersion: 115
  VirtualFolderPath: "VFX"
}
