package edu.cdl.iot.db.reset.schema.definitions

import edu.cdl.iot.db.reset.schema.{Feature, FeatureClassification, FeatureType, Schema}

object Prototype {
  val dummy: Schema = new Schema("dummy",
    List(
      Feature("Auto-Increment", FeatureType.Integer, FeatureClassification.ThrowAway),
      Feature("Sensor ID", FeatureType.Integer, FeatureClassification.Key),
      Feature("Timestamp", FeatureType.String, FeatureClassification.Timestamp),
      Feature("Temperature", FeatureType.Double, FeatureClassification.Feature),
      Feature("Pressure", FeatureType.Double, FeatureClassification.Feature),
      Feature("Wind", FeatureType.Double, FeatureClassification.Feature)
    )
  )
  val baxter: Schema = new Schema("baxter",
    List(
      Feature("Session-ID", FeatureType.Integer, FeatureClassification.Key),
      Feature("Timestamp", FeatureType.String, FeatureClassification.Timestamp),
      Feature("Target", FeatureType.Double, FeatureClassification.Label)

      // TODO Add more
    )
  )
}
