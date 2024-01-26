diff {
  skip {
    drop_schema = true
    drop_table  = true
  }

  concurrent_index {
    create = true
    drop   = true
  }
}

env "test" {
  migration {
    dir = "file://migrations?format=golang-migrate" 
    format = golang-migrate
  }

  dev = "docker://postgres/13/dev?search_path=public"
}