Parameter name, female
Return Trim(m.name)+iif(glasn(Right(Trim(m.name), 1)), '', 'о')+'в'+iif(m.female, 'на', 'ич')