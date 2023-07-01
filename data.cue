package seasons

import (
	"encoding/csv"
	"list"
	"time"
)

months: [
	for month, num in _months {
		current: num
		if num == 12 {next: 1}
		if num != 12 {next: num + 1}
		categories: [
			for category in list.SortStrings(_categories) {
				name:  category
				items: list.SortStrings([
					for e in _data if e[1] == month && e[2] == category {
						e[0]
					},
				])
			},
		]
	},
]

_categories: [ for k, v in {for e in _data {"\(e[2])": _}} {k}]

_months: {
	let fr_en = {
		Janvier:   "January"
		Février:   "February"
		Mars:      "March"
		Avril:     "April"
		Mai:       "May"
		Juin:      "June"
		Juillet:   "July"
		Août:      "August"
		Septembre: "September"
		Octobre:   "October"
		Novembre:  "November"
		Décembre:  "December"
	}

	for e in _data {
		"\(e[1])": {
			let parts = time.Split(time.Parse("January", fr_en[e[1]]))
			parts.month
		}
	}
}

// Extracted from https://www.greenpeace.fr/guetteur/calendrier
_data: csv.Decode(_raw_data)
_raw_data: '''
	Ail,Janvier,Légumes
	Betterave,Janvier,Légumes
	Carotte,Janvier,Légumes
	Céleri-branche,Janvier,Légumes
	Céleri-rave,Janvier,Légumes
	Chou,Janvier,Légumes
	Chou blanc,Janvier,Légumes
	Chou de Bruxelles,Janvier,Légumes
	Chou frisé,Janvier,Légumes
	Chou rouge,Janvier,Légumes
	Courge,Janvier,Légumes
	Crosne,Janvier,Légumes
	Endive,Janvier,Légumes
	Épinard,Janvier,Légumes
	Frisée,Janvier,Légumes
	Mâche,Janvier,Légumes
	Navet,Janvier,Légumes
	Oignon,Janvier,Légumes
	Panais,Janvier,Légumes
	Poireau,Janvier,Légumes
	Pomme de terre de conservation,Janvier,Légumes
	Salsifi,Janvier,Légumes
	Topinambour,Janvier,Légumes
	Amande sèche,Janvier,Fruits
	Citron,Janvier,Fruits
	Clémentine,Janvier,Fruits
	Kaki,Janvier,Fruits
	Kiwi,Janvier,Fruits
	Mandarine,Janvier,Fruits
	Orange,Janvier,Fruits
	Pamplemousse,Janvier,Fruits
	Physalis,Janvier,Fruits
	Poire,Janvier,Fruits
	Pomme,Janvier,Fruits
	Lentille,Janvier,Céréales & légumineuses
	Ail,Février,Légumes
	Betterave,Février,Légumes
	Carotte,Février,Légumes
	Céleri-rave,Février,Légumes
	Chou blanc,Février,Légumes
	Chou de Bruxelles,Février,Légumes
	Chou frisé,Février,Légumes
	Chou rouge,Février,Légumes
	Crosne,Février,Légumes
	Endive,Février,Légumes
	Épinard,Février,Légumes
	Frisée,Février,Légumes
	Mâche,Février,Légumes
	Navet,Février,Légumes
	Oignon,Février,Légumes
	Panais,Février,Légumes
	Poireau,Février,Légumes
	Pomme de terre de conservation,Février,Légumes
	Radis,Février,Légumes
	Salsifi,Février,Légumes
	Topinambour,Février,Légumes
	Amande sèche,Février,Fruits
	Citron,Février,Fruits
	Clémentine,Février,Fruits
	Kiwi,Février,Fruits
	Mandarine,Février,Fruits
	Orange,Février,Fruits
	Pamplemousse,Février,Fruits
	Physalis,Février,Fruits
	Poire,Février,Fruits
	Pomme,Février,Fruits
	Lentille,Février,Céréales & légumineuses
	Ail,Mars,Légumes
	Asperge,Mars,Légumes
	Betterave,Mars,Légumes
	Blette,Mars,Légumes
	Carotte,Mars,Légumes
	Céleri-rave,Mars,Légumes
	Chou,Mars,Légumes
	Chou de Bruxelles,Mars,Légumes
	Chou-fleur,Mars,Légumes
	Crosne,Mars,Légumes
	Endive,Mars,Légumes
	Épinard,Mars,Légumes
	Frisée,Mars,Légumes
	Navet,Mars,Légumes
	Oignon,Mars,Légumes
	Panais,Mars,Légumes
	Poireau,Mars,Légumes
	Pomme de terre de conservation,Mars,Légumes
	Radis,Mars,Légumes
	Salsifi,Mars,Légumes
	Topinambour,Mars,Légumes
	Amande sèche,Mars,Fruits
	Citron,Mars,Fruits
	Kiwi,Mars,Fruits
	Orange,Mars,Fruits
	Pamplemousse,Mars,Fruits
	Poire,Mars,Fruits
	Pomme,Mars,Fruits
	Lentille,Mars,Céréales & légumineuses
	Ail,Avril,Légumes
	Artichaut,Avril,Légumes
	Asperge,Avril,Légumes
	Betterave,Avril,Légumes
	Blette,Avril,Légumes
	Carotte,Avril,Légumes
	Chou-fleur,Avril,Légumes
	Concombre,Avril,Légumes
	Endive,Avril,Légumes
	Épinard,Avril,Légumes
	Frisée,Avril,Légumes
	Laitue,Avril,Légumes
	Navet,Avril,Légumes
	Oignon,Avril,Légumes
	Petit pois,Avril,Légumes
	Poireau,Avril,Légumes
	Pomme de terre primeur,Avril,Légumes
	Radis,Avril,Légumes
	Amande sèche,Avril,Fruits
	Citron,Avril,Fruits
	Pamplemousse,Avril,Fruits
	Poire,Avril,Fruits
	Pomme,Avril,Fruits
	Ail,Mai,Légumes
	Artichaut,Mai,Légumes
	Asperge,Mai,Légumes
	Aubergine,Mai,Légumes
	Betterave,Mai,Légumes
	Blette,Mai,Légumes
	Carotte,Mai,Légumes
	Chou-fleur,Mai,Légumes
	Concombre,Mai,Légumes
	Courgette,Mai,Légumes
	Épinard,Mai,Légumes
	Laitue,Mai,Légumes
	Navet,Mai,Légumes
	Oignon,Mai,Légumes
	Petit pois,Mai,Légumes
	Pomme de terre primeur,Mai,Légumes
	Radis,Mai,Légumes
	Amande sèche,Mai,Fruits
	Cerise,Mai,Fruits
	Fraise,Mai,Fruits
	Pamplemousse,Mai,Fruits
	Rhubarbe,Mai,Fruits
	Tomate,Mai,Fruits
	Ail,Juin,Légumes
	Artichaut,Juin,Légumes
	Asperge,Juin,Légumes
	Aubergine,Juin,Légumes
	Betterave,Juin,Légumes
	Blette,Juin,Légumes
	Brocoli,Juin,Légumes
	Carotte,Juin,Légumes
	Chou romanesco,Juin,Légumes
	Concombre,Juin,Légumes
	Courgette,Juin,Légumes
	Épinard,Juin,Légumes
	Fenouil,Juin,Légumes
	Haricot vert,Juin,Légumes
	Laitue,Juin,Légumes
	Navet,Juin,Légumes
	Oignon,Juin,Légumes
	Petit pois,Juin,Légumes
	Poivron,Juin,Légumes
	Pomme de terre primeur,Juin,Légumes
	Radis,Juin,Légumes
	Abricot,Juin,Fruits
	Amande sèche,Juin,Fruits
	Brugnon,Juin,Fruits
	Cassis,Juin,Fruits
	Cerise,Juin,Fruits
	Citron,Juin,Fruits
	Fraise,Juin,Fruits
	Framboise,Juin,Fruits
	Groseille,Juin,Fruits
	Melon,Juin,Fruits
	Pamplemousse,Juin,Fruits
	Pastèque,Juin,Fruits
	Pêche,Juin,Fruits
	Pomme,Juin,Fruits
	Prune,Juin,Fruits
	Rhubarbe,Juin,Fruits
	Tomate,Juin,Fruits
	Avoine d'hiver,Juin,Céréales & légumineuses
	Avoine de printemps,Juin,Céréales & légumineuses
	Orge d'hiver,Juin,Céréales & légumineuses
	Pois,Juin,Céréales & légumineuses
	Seigle,Juin,Céréales & légumineuses
	Ail,Juillet,Légumes
	Artichaut,Juillet,Légumes
	Asperge,Juillet,Légumes
	Aubergine,Juillet,Légumes
	Betterave,Juillet,Légumes
	Blette,Juillet,Légumes
	Brocoli,Juillet,Légumes
	Carotte,Juillet,Légumes
	Céleri-branche,Juillet,Légumes
	Chou romanesco,Juillet,Légumes
	Concombre,Juillet,Légumes
	Courgette,Juillet,Légumes
	Épinard,Juillet,Légumes
	Fenouil,Juillet,Légumes
	Haricot vert,Juillet,Légumes
	Laitue,Juillet,Légumes
	Oignon,Juillet,Légumes
	Petit pois,Juillet,Légumes
	Poivron,Juillet,Légumes
	Pomme de terre primeur,Juillet,Légumes
	Radis,Juillet,Légumes
	Abricot,Juillet,Fruits
	Amande fraiche,Juillet,Fruits
	Amande sèche,Juillet,Fruits
	Brugnon,Juillet,Fruits
	Cassis,Juillet,Fruits
	Cerise,Juillet,Fruits
	Figue,Juillet,Fruits
	Fraise,Juillet,Fruits
	Framboise,Juillet,Fruits
	Groseille,Juillet,Fruits
	Melon,Juillet,Fruits
	Myrtille,Juillet,Fruits
	Nectarine,Juillet,Fruits
	Pastèque,Juillet,Fruits
	Pêche,Juillet,Fruits
	Poire,Juillet,Fruits
	Prune,Juillet,Fruits
	Rhubarbe,Juillet,Fruits
	Tomate,Juillet,Fruits
	Avoine d'hiver,Juillet,Céréales & légumineuses
	Avoine de printemps,Juillet,Céréales & légumineuses
	Blé dur d'hiver et de printemps,Juillet,Céréales & légumineuses
	Blé tendre d'hiver et de printemps,Juillet,Céréales & légumineuses
	Féveroles et fèves,Juillet,Céréales & légumineuses
	Haricot blanc,Juillet,Céréales & légumineuses
	Maïs,Juillet,Céréales & légumineuses
	Orge d'hiver,Juillet,Céréales & légumineuses
	Orge de printemps,Juillet,Céréales & légumineuses
	Pois,Juillet,Céréales & légumineuses
	Seigle,Juillet,Céréales & légumineuses
	Ail,Août,Légumes
	Artichaut,Août,Légumes
	Aubergine,Août,Légumes
	Betterave,Août,Légumes
	Blette,Août,Légumes
	Brocoli,Août,Légumes
	Carotte,Août,Légumes
	Céleri-branche,Août,Légumes
	Chou blanc,Août,Légumes
	Chou romanesco,Août,Légumes
	Chou rouge,Août,Légumes
	Concombre,Août,Légumes
	Courge,Août,Légumes
	Courgette,Août,Légumes
	Épinard,Août,Légumes
	Fenouil,Août,Légumes
	Frisée,Août,Légumes
	Haricot vert,Août,Légumes
	Laitue,Août,Légumes
	Oignon,Août,Légumes
	Poivron,Août,Légumes
	Pomme de terre primeur,Août,Légumes
	Radis,Août,Légumes
	Abricot,Août,Fruits
	Amande fraiche,Août,Fruits
	Amande sèche,Août,Fruits
	Baie de goji,Août,Fruits
	Brugnon,Août,Fruits
	Cassis,Août,Fruits
	Figue,Août,Fruits
	Fraise,Août,Fruits
	Framboise,Août,Fruits
	Groseille,Août,Fruits
	Melon,Août,Fruits
	Mirabelle,Août,Fruits
	Mûre,Août,Fruits
	Myrtille,Août,Fruits
	Nectarine,Août,Fruits
	Noisette,Août,Fruits
	Pastèque,Août,Fruits
	Pêche,Août,Fruits
	Poire,Août,Fruits
	Pomme,Août,Fruits
	Prune,Août,Fruits
	Pruneau,Août,Fruits
	Raisin,Août,Fruits
	Tomate,Août,Fruits
	Avoine d'hiver,Août,Céréales & légumineuses
	Avoine de printemps,Août,Céréales & légumineuses
	Blé dur d'hiver et de printemps,Août,Céréales & légumineuses
	Blé tendre d'hiver et de printemps,Août,Céréales & légumineuses
	Féveroles et fèves,Août,Céréales & légumineuses
	Haricot blanc,Août,Céréales & légumineuses
	Maïs,Août,Céréales & légumineuses
	Orge d'hiver,Août,Céréales & légumineuses
	Orge de printemps,Août,Céréales & légumineuses
	Pois,Août,Céréales & légumineuses
	Quinoa,Août,Céréales & légumineuses
	Seigle,Août,Céréales & légumineuses
	Ail,Septembre,Légumes
	Artichaut,Septembre,Légumes
	Aubergine,Septembre,Légumes
	Betterave,Septembre,Légumes
	Blette,Septembre,Légumes
	Brocoli,Septembre,Légumes
	Carotte,Septembre,Légumes
	Céleri-branche,Septembre,Légumes
	Chou,Septembre,Légumes
	Chou blanc,Septembre,Légumes
	Chou de Bruxelles,Septembre,Légumes
	Chou-fleur,Septembre,Légumes
	Chou frisé,Septembre,Légumes
	Chou romanesco,Septembre,Légumes
	Chou rouge,Septembre,Légumes
	Concombre,Septembre,Légumes
	Courge,Septembre,Légumes
	Courgette,Septembre,Légumes
	Épinard,Septembre,Légumes
	Fenouil,Septembre,Légumes
	Frisée,Septembre,Légumes
	Haricot vert,Septembre,Légumes
	Laitue,Septembre,Légumes
	Oignon,Septembre,Légumes
	Panais,Septembre,Légumes
	Patate douce,Septembre,Légumes
	Poireau,Septembre,Légumes
	Poivron,Septembre,Légumes
	Pomme de terre de conservation,Septembre,Légumes
	Potiron,Septembre,Légumes
	Radis,Septembre,Légumes
	Amande sèche,Septembre,Fruits
	Baie de goji,Septembre,Fruits
	Coing,Septembre,Fruits
	Figue,Septembre,Fruits
	Melon,Septembre,Fruits
	Mirabelle,Septembre,Fruits
	Mûre,Septembre,Fruits
	Myrtille,Septembre,Fruits
	Noisette,Septembre,Fruits
	Noix,Septembre,Fruits
	Pastèque,Septembre,Fruits
	Pêche,Septembre,Fruits
	Poire,Septembre,Fruits
	Pomme,Septembre,Fruits
	Prune,Septembre,Fruits
	Pruneau,Septembre,Fruits
	Raisin,Septembre,Fruits
	Tomate,Septembre,Fruits
	Haricot blanc,Septembre,Céréales & légumineuses
	Maïs,Septembre,Céréales & légumineuses
	Quinoa,Septembre,Céréales & légumineuses
	Riz,Septembre,Céréales & légumineuses
	Sarrasin,Septembre,Céréales & légumineuses
	Tournesol,Septembre,Céréales & légumineuses
	Ail,Octobre,Légumes
	Aubergine,Octobre,Légumes
	Betterave,Octobre,Légumes
	Blette,Octobre,Légumes
	Brocoli,Octobre,Légumes
	Carotte,Octobre,Légumes
	Céleri-branche,Octobre,Légumes
	Céleri-rave,Octobre,Légumes
	Chou,Octobre,Légumes
	Chou blanc,Octobre,Légumes
	Chou de Bruxelles,Octobre,Légumes
	Chou-fleur,Octobre,Légumes
	Chou frisé,Octobre,Légumes
	Chou rouge,Octobre,Légumes
	Concombre,Octobre,Légumes
	Courge,Octobre,Légumes
	Courgette,Octobre,Légumes
	Echalote,Octobre,Légumes
	Endive,Octobre,Légumes
	Épinard,Octobre,Légumes
	Fenouil,Octobre,Légumes
	Frisée,Octobre,Légumes
	Haricot vert,Octobre,Légumes
	Laitue,Octobre,Légumes
	Navet,Octobre,Légumes
	Oignon,Octobre,Légumes
	Panais,Octobre,Légumes
	Patate douce,Octobre,Légumes
	Poireau,Octobre,Légumes
	Pomme de terre de conservation,Octobre,Légumes
	Potiron,Octobre,Légumes
	Radis,Octobre,Légumes
	Rutabaga,Octobre,Légumes
	Salsifi,Octobre,Légumes
	Topinambour,Octobre,Légumes
	Amande sèche,Octobre,Fruits
	Baie de goji,Octobre,Fruits
	Châtaigne,Octobre,Fruits
	Citron,Octobre,Fruits
	Coing,Octobre,Fruits
	Figue,Octobre,Fruits
	Framboise,Octobre,Fruits
	Kaki,Octobre,Fruits
	Myrtille,Octobre,Fruits
	Noisette,Octobre,Fruits
	Noix,Octobre,Fruits
	Physalis,Octobre,Fruits
	Poire,Octobre,Fruits
	Pomme,Octobre,Fruits
	Raisin,Octobre,Fruits
	Tomate,Octobre,Fruits
	Haricot blanc,Octobre,Céréales & légumineuses
	Maïs,Octobre,Céréales & légumineuses
	Quinoa,Octobre,Céréales & légumineuses
	Riz,Octobre,Céréales & légumineuses
	Sarrasin,Octobre,Céréales & légumineuses
	Soja,Octobre,Céréales & légumineuses
	Ail,Novembre,Légumes
	Betterave,Novembre,Légumes
	Brocoli,Novembre,Légumes
	Cardon,Novembre,Légumes
	Carotte,Novembre,Légumes
	Céleri-branche,Novembre,Légumes
	Céleri-rave,Novembre,Légumes
	Chou,Novembre,Légumes
	Chou blanc,Novembre,Légumes
	Chou de Bruxelles,Novembre,Légumes
	Chou-fleur,Novembre,Légumes
	Chou frisé,Novembre,Légumes
	Chou rouge,Novembre,Légumes
	Citrouille,Novembre,Légumes
	Courge,Novembre,Légumes
	Crosne,Novembre,Légumes
	Echalote,Novembre,Légumes
	Endive,Novembre,Légumes
	Épinard,Novembre,Légumes
	Fenouil,Novembre,Légumes
	Frisée,Novembre,Légumes
	Mâche,Novembre,Légumes
	Navet,Novembre,Légumes
	Oignon,Novembre,Légumes
	Panais,Novembre,Légumes
	Poireau,Novembre,Légumes
	Pomme de terre de conservation,Novembre,Légumes
	Potiron,Novembre,Légumes
	Radis,Novembre,Légumes
	Rutabaga,Novembre,Légumes
	Salsifi,Novembre,Légumes
	Topinambour,Novembre,Légumes
	Amande sèche,Novembre,Fruits
	Châtaigne,Novembre,Fruits
	Citron,Novembre,Fruits
	Clémentine,Novembre,Fruits
	Coing,Novembre,Fruits
	Kaki,Novembre,Fruits
	Kiwi,Novembre,Fruits
	Mandarine,Novembre,Fruits
	Orange,Novembre,Fruits
	Physalis,Novembre,Fruits
	Poire,Novembre,Fruits
	Pomme,Novembre,Fruits
	Lentille,Novembre,Céréales & légumineuses
	Maïs,Novembre,Céréales & légumineuses
	Ail,Décembre,Légumes
	Betterave,Décembre,Légumes
	Carotte,Décembre,Légumes
	Céleri-branche,Décembre,Légumes
	Céleri-rave,Décembre,Légumes
	Chou,Décembre,Légumes
	Chou blanc,Décembre,Légumes
	Chou de Bruxelles,Décembre,Légumes
	Chou frisé,Décembre,Légumes
	Chou rouge,Décembre,Légumes
	Courge,Décembre,Légumes
	Crosne,Décembre,Légumes
	Echalote,Décembre,Légumes
	Endive,Décembre,Légumes
	Épinard,Décembre,Légumes
	Frisée,Décembre,Légumes
	Mâche,Décembre,Légumes
	Navet,Décembre,Légumes
	Oignon,Décembre,Légumes
	Panais,Décembre,Légumes
	Poireau,Décembre,Légumes
	Pomme de terre de conservation,Décembre,Légumes
	Potiron,Décembre,Légumes
	Radis,Décembre,Légumes
	Rutabaga,Décembre,Légumes
	Salsifi,Décembre,Légumes
	Topinambour,Décembre,Légumes
	Amande sèche,Décembre,Fruits
	Châtaigne,Décembre,Fruits
	Citron,Décembre,Fruits
	Clémentine,Décembre,Fruits
	Kaki,Décembre,Fruits
	Kiwi,Décembre,Fruits
	Mandarine,Décembre,Fruits
	Orange,Décembre,Fruits
	Physalis,Décembre,Fruits
	Poire,Décembre,Fruits
	Pomme,Décembre,Fruits
	Avoine d'hiver,Décembre,Céréales & légumineuses
	Avoine de printemps,Décembre,Céréales & légumineuses
	Blé dur d'hiver et de printemps,Décembre,Céréales & légumineuses
	Blé tendre d'hiver et de printemps,Décembre,Céréales & légumineuses
	Féveroles et fèves,Décembre,Céréales & légumineuses
	Lentille,Décembre,Céréales & légumineuses
	Orge d'hiver,Décembre,Céréales & légumineuses
	Orge de printemps,Décembre,Céréales & légumineuses
	Pois,Décembre,Céréales & légumineuses
	Seigle,Décembre,Céréales & légumineuses
	'''
