while test $# -gt 0; do
	case "$1" in
		--help|-h)
			echo "--help, -h - wyświetla ten tekst"
			echo "--date, -d - wyświetla dzisiejszą datę w formacie dzien.miesiąc.rok"
			echo "--logs [liczba], -l [liczba] - utworzy automatycznie [liczba] plików log[liczba].txt, [liczba] – numerpliku od 1 do [liczba]. Domyślna [liczba] - 100"
			echo "--error [liczba], -e [liczba] - utworzy automatycznie [liczba] plików error[liczba].txt, [liczba] – numerpliku od 1 do [liczba]. Domyślna [liczba] - 100"
			echo "--init - klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH. Musi być uruchomiony za pomocą source, np. source skrypt.sh --init"
			exit 0
		;;

		--date|-d)
			date +%d.%m.%Y
			exit 0
		;;

		--logs|-l)
			shift
			if test $# -gt 0; then
				export fin=$1
			else
				export fin=100
			fi
			shift
			for i in $(seq 1 $fin);
			do
				echo "log$i.txt" > log$i.txt
				echo "${0##*/}" >> log$i.txt
				echo "$(date +%d.%m.%Y)" >> log$i.txt
			done
			exit 0
		;;

		--error|-e)
			shift
			if test $# -gt 0; then
				export fin=$1
			else
				export fin=100
			fi
			shift
			for i in $(seq 1 $fin);
			do
				mkdir error$i
				echo "error$i.txt" > error$i/error$i.txt
				echo "${0##*/}" >> error$i/error$i.txt
				echo "$(date +%d.%m.%Y)" >> error$i/error$i.txt
			done
			exit 0
		;;

		--init)
			if [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
				git clone https://github.com/Kargtar/dsw-git-2.git
				case "$PATH" in
					*$(pwd)/dsw-git-2*) : ;;
					*) export PATH=$PATH:$(pwd)/dsw-git-2 ;;
				esac
				return 0
			else
				echo "skrypt musi być uruchomiony za pomocą 'source' żeby zmiany w PATH pojawiły się w parent shell'u"
				exit 1
			fi
		;;

		*)
			break
		;;
	esac
done
