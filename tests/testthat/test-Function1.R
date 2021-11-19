Testing <- test_that("Testing function", {
  FlowFunc <- Function1(datateachr::flow_sample,month,flow)
  expect_true(is.data.frame(datateachr::flow_sample))
  expect_true(is.numeric(datateachr::flow_sample$flow))
  expect_error(Function1(datateachr::flow_sample,month))
  expect_error(Function1(datateachr::flow_sample,flow))
  expect_s3_class(Function1(datateachr::flow_sample,month,flow), c("tbl_df", "tbl", "data.frame", "list"))
  }
  )

