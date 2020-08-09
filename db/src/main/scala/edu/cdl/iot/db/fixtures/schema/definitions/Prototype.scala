package edu.cdl.iot.db.fixtures.schema.definitions

import java.util.UUID

import edu.cdl.iot.db.fixtures.schema.{Feature, FeatureClassification, FeatureType, Schema}

object Prototype {
  val dummy: Schema = new Schema(
    "dummy",
    UUID.fromString("b6ee5bab-08dd-49b0-98b6-45cd0a28b12f"),
    List(
      Feature("Auto-Increment", FeatureType.Integer, FeatureClassification.ThrowAway),
      Feature("Sensor ID", FeatureType.Integer, FeatureClassification.Key),
      Feature("Timestamp", FeatureType.String, FeatureClassification.Timestamp),
      Feature("Temperature", FeatureType.Double, FeatureClassification.Feature),
      Feature("Pressure", FeatureType.Double, FeatureClassification.Feature),
      Feature("Wind", FeatureType.Double, FeatureClassification.Feature)
    ),
    true
  )

  val baxter: Schema = new Schema(
    "baxter",
    UUID.fromString("e41aa8e4-d79b-4bcc-b5d4-45eb457e6f93"),
    List(
      Feature("Session-ID", FeatureType.Integer, FeatureClassification.Key),
      Feature("Timestamp", FeatureType.String, FeatureClassification.Timestamp),
      Feature("Target", FeatureType.Double, FeatureClassification.Label),
      Feature("weekday_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("weekday_enc2", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc2", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc3", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc4", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc5", FeatureType.Double, FeatureClassification.Feature),
      Feature("hospital_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc2", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc3", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc4", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc5", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc6", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc7", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc8", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc9", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc10", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc11", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc12", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc13", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc14", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc15", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc16", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc17", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc18", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc19", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc20", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc21", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc22", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc23", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc24", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc25", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc26", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc27", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc2", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc3", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc4", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc5", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc6", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc7", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc8", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc9", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc10", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc11", FeatureType.Double, FeatureClassification.Feature)
    )
  )
}
