diff {
  skip {
    drop_schema = true
    drop_table  = true
  }
}

lint {
  concurrent_index {
    error = true
  }
}

env "test" {
  migration {
    dir = "file://migrations" 
    format = golang-migrate
  }

  url = "postgres://test:test@localhost:5432/test?sslmode=disable&search_path=public"
  dev = "docker://postgres/13/dev?search_path=public"
}

env "ci" {
  migration {
    dir = "file://migrations" 
    format = golang-migrate
  }

  url = "postgres://dev:dev@localhost:5433/dev?sslmode=disable&search_path=public"
  dev = "postgres://test:test@localhost:5432/test?sslmode=disable&search_path=public"
}
