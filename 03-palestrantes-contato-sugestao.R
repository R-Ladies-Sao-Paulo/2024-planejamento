url_form_palestrantes <- "https://docs.google.com/spreadsheets/d/1JD38PqWcchaCTmT45soluym7HBMAMCV3JD95E-egjHY/edit#gid=0"

form_palestrantes <- googlesheets4::read_sheet(url_form_palestrantes, sheet = "sugestoes-palestrantes") 

sugestao_palestrantes <- form_palestrantes |> 
  janitor::clean_names() |> 
  dplyr::mutate(
    convite_feito = ifelse(
convite_enviado == "Sim", TRUE, FALSE
    ),
    convite_aceito = ifelse(
      resposta == "Sim", TRUE, FALSE
    )
  ) |> 
  dplyr::summarise(
    n = dplyr::n(),
    quantidade_convites_feitos = sum(convite_feito),
    quantidade_convites_aceitos = sum(convite_aceito),
  )

readr::write_rds(sugestao_palestrantes, "sugestao_palestrantes.rds")
