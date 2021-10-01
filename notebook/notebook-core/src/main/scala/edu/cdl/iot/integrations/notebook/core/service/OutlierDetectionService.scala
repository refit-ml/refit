package edu.cdl.iot.integrations.notebook.core.service
import scala.math.sqrt

class OutlierDetectionService(val threshold:Double) {
  private var num:Double = 0
  private var mean:Double = 0.0
  private var variance:Double = 0.0

  def update(data:Double): Unit ={
    num = num + 1
    val newMean = mean+(data-mean)*1.0/num
    val newStd = variance+(data-mean)*(data-newMean)
    mean = newMean
    variance = newStd
  }
  def isOutlier(data:Double): Boolean ={
    if(num<5){
      return false
    }
    val a = variance/(num-1.0)
    val std = sqrt(a)
    val upper = mean+num*std
    val lower = mean-num*std
    if (data<lower || data>upper){
       true
    }else{
       false
    }
  }

}
