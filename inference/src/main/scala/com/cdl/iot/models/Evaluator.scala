package com.cdl.iot.models

import org.jpmml.evaluator.ModelEvaluator

case class Evaluator(
                      key: String,
                      evaluator: ModelEvaluator[_]
                    )
