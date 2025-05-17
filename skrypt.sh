while test $# -gt 0; do
	case "$1" in
		--help)
			echo "--date - wyświetla dzisiejszą datę w formacie dzien.miesiąc.rok"
			echo "--logs [liczba] - utworzy automatycznie [liczba] plików log[liczba].txt, [liczba] – numerpliku od 1 do [liczba]. Domyślna [liczba] - 100"
			exit 0
		;;

		--date)
			date +%d.%m.%Y
			exit 0
		;;

		--logs)
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

		*)
			break
		;;
	esac
done
