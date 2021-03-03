package edu.cdl.iot.inference.jdbi.repository

import edu.cdl.iot.data.postgres.repository.JdbiStaticDataRepository
import edu.cdl.iot.inference.core.repository.InferenceStaticDataRepository
import org.jdbi.v3.core.Jdbi

class InferenceJdbiStaticDataRepository(jdbi: Jdbi)
  extends JdbiStaticDataRepository(jdbi)
    with InferenceStaticDataRepository
