# -*- coding: utf-8 -*-
from __future__ import absolute_import
import requests
from .po_utilities import OSDBServer
from ..utilities import languageTranslate, log


def search_subtitles(file_original_path, title, tvshow, year, season, episode, set_temp, rar, lang1, lang2, lang3, stack): #standard input
	osdb_server = OSDBServer()
	language1 = languageTranslate(lang1, 0, 2)
	language2 = languageTranslate(lang2, 0, 2)
	language3 = languageTranslate(lang3, 0, 2)
	subtitles_list = osdb_server.search_subtitles(title, tvshow, season, episode, [language1, language2, language3], year)
	return subtitles_list, "", "" #standard output

def download_subtitles(subtitles_list, pos, zip_subs, tmp_sub_dir, sub_folder, session_id): #standard input
	OSDBServer()
	params = subtitles_list[pos]
	url = params["link"]
	log(__name__, 'link: %s' % url)
	language_name = params["language_name"]

	response = requests.head(url)		#PROVJERI DALI FAJL POSTOJI
	if response.status_code == requests.codes.ok:		#True:
		response = requests.get(url)		#SKINI GA
		open(zip_subs, 'wb').write(response.content)

	return True, language_name, "" #standard output