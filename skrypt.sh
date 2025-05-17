while test $# -gt 0; do
	case "$1" in
		--date)
			date +%d.%m.%Y
			exit 0
		;;

		*)
			break
		;;
	esac
done
