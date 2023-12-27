# Caminho para o arquivo com as respostas
url_sheets <- "https://docs.google.com/spreadsheets/d/1Ydvo55Ypu73E6MAn8KP7kZC6VXqOT393XMoaDykAMLA/edit?resourcekey#gid=2129768250"


# Importando o arquivo
formulario <- googlesheets4::read_sheet(url_sheets) |> 
  janitor::clean_names() |> 
  tibble::rowid_to_column()

# Cada linha é uma resposta

readr::write_rds(formulario, "formulario.rds")
