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
    ),
    true
  )

  val baxter: Schema = new Schema("baxter",
    List(
      Feature("Session-ID", FeatureType.Integer, FeatureClassification.Key),
      Feature("Timestamp", FeatureType.String, FeatureClassification.Timestamp),
      Feature("Target", FeatureType.Double, FeatureClassification.Label),
      Feature("Shift-1", FeatureType.Double, FeatureClassification.Feature),
      Feature("Shift-2", FeatureType.Double, FeatureClassification.Feature),
      Feature("Shift-3", FeatureType.Double, FeatureClassification.Feature),
      Feature("weekday_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("weekend_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("eventName_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("weekNumber_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("month_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedDrugName_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("groupedCareArea_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("hospital_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("pumpID_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("advisory_enc", FeatureType.Double, FeatureClassification.Feature),
      Feature("timeSinceLastAlert", FeatureType.Double, FeatureClassification.Feature),
      Feature("drugAmount", FeatureType.Double, FeatureClassification.Feature),
      Feature("diluent", FeatureType.Double, FeatureClassification.Feature),
      Feature("vtbi", FeatureType.Double, FeatureClassification.Feature),
      Feature("patientWeight", FeatureType.Double, FeatureClassification.Feature),
      Feature("remainingTime", FeatureType.Double, FeatureClassification.Feature),
      Feature("flowRate", FeatureType.Double, FeatureClassification.Feature),
      Feature("doseRate", FeatureType.Double, FeatureClassification.Feature),
      Feature("deltaFlowRate", FeatureType.Double, FeatureClassification.Feature),
      Feature("deltaDoseRate", FeatureType.Double, FeatureClassification.Feature),
      Feature("deltaVTBI", FeatureType.Double, FeatureClassification.Feature)
    )
  )
}
