package edu.cdl.iot.integrations.notebook.core

import java.text.SimpleDateFormat
import java.util.UUID

import edu.cdl.iot.common.domain.{Project, Sensor, TrainingWindow}
import edu.cdl.iot.integrations.notebook.core.repository._
import edu.cdl.iot.integrations.notebook.core.service.NotebookUploadService
import org.scalatest.BeforeAndAfterAll
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

class NotebookQueryServiceTests extends AnyFlatSpec with should.Matchers with BeforeAndAfterAll {

  private val fakeProjectRepo = new NotebookProjectRepository {
    override def find(projectGuid: UUID): Project = ???

    def find: List[Project] = ???

    def save(project: Project): Unit = ???
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

  private val fakeUploadRepo = new NotebookUploadFileRepository {
    override def uploadFile(fileName: String, filePath: String): Unit = ???

    override def uploadFileStatus(fileName: String): Unit = ???
  }

  private val fakeUploadService = new NotebookUploadService(fakeUploadRepo) {
    override def uploadFileObject(fileName: String, filePath: String): Unit = ???

    override def uploadFileStatus(fileName: String): Unit = ???
  }


  val projectGuid = UUID.fromString("fake-project-guid")
  val format = new SimpleDateFormat("yyyy-MM-dd H:mm:ss")
  val from = format.format("2020-01-01 12:00:00")
  val to = format.format("2020-01-01 18:00:00")
  val sensors = List.range(1, 20).map(_.toString)

  /*
  "Query" should "Return TransactionID as UUID" in {
    val actual =  new NotebookQueryService(fakeProjectRepo, fakeSensorRepo, fakePredictionRepo,
                                            fakeTrainingRepo, fakeUploadService).query(projectGuid, from, to, sensors)
    val expected = 2
    actual should be(expected)

  }
*/
}