package edu.cdl.iot.integrations.notebook.core.service


import java.util.UUID
import edu.cdl.iot.common.domain.{Project, Sensor, TrainingWindow}
import edu.cdl.iot.integrations.notebook.core.repository._
import org.joda.time.DateTime
import org.scalatest.BeforeAndAfterAll
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

import java.sql.Timestamp
import java.text.SimpleDateFormat
import java.time.LocalDateTime

class NotebookQueryServiceTests extends AnyFlatSpec with should.Matchers with BeforeAndAfterAll {
  private val fakeProjectRepo = new NotebookProjectRepository {
    override def find(projectGuid: UUID): Project = ???
    override def find: List[Project] = ???
    override def save(project: Project): Unit = ???
  }
  private val fakeSensorRepo = new NotebookSensorRepository {
    override def findAll: List[String] = ???
    override def findAll(projectGuid: String): List[String] = ???
    override def save(sensors: Seq[Sensor]): Unit = ???
  }
  private val fakePredictionRepo = new NotebookPredictionRepository {
    override def find(projectGuid: String, sensorId: String, partitions: List[String]): List[Map[String, String]] = ???
  }
  private val fakeTrainingRepo = new NotebookTrainingWindowRepository {
    override def find(projectGuid: UUID, sensorId: String, partitionKey: String): List[TrainingWindow] = ???
    override def save(trainingWindow: Seq[TrainingWindow]) = ???
  }

  val projectGuid = UUID.randomUUID()
  val format = new SimpleDateFormat("yyyy-MM-dd H:mm:ss")
  val from_date = format.parse("2020-01-01 12:00:00")
  val to_date = format.parse("2020-01-01 18:00:00")
  val from = new DateTime(from_date)
  val to = new DateTime(from_date)
  val sensors = List.range(1, 20).map(_.toString)

  "Query" should "Return dataObject as List[Map[String, String]]" in {
    val actual =  new NotebookQueryService(fakeProjectRepo, fakeSensorRepo, fakePredictionRepo,
                                            fakeTrainingRepo).query(projectGuid, from,to, sensors)
    val expected: List[Map[String,String]] = List(Map("2"->"45","5"->"100"))
    actual should be(expected)
  }

  "TrainingWindow" should "Return dataObject as List[TrainingWindow]" in {
    val actual =  new NotebookQueryService(fakeProjectRepo, fakeSensorRepo, fakePredictionRepo,
      fakeTrainingRepo).trainingWindow(projectGuid, from,to, sensors)
    val train1 = new TrainingWindow(projectGuid.toString,"12345", "abc",Timestamp.valueOf(LocalDateTime.now()),Timestamp.valueOf(LocalDateTime.now()))
    val expected: List[TrainingWindow]= List(train1)
    actual should be(expected)
  }

}