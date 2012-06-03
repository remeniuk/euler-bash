sqr(){
	echo $(($1 * $1))
}

sqrt() {
	printf "%.0f\n" $(echo "sqrt ( $1 )" | bc -l)
}

filter_primes() {
	range=$1
	primes=()
	for (( i=2; i<=$range; i++ ))
	do
		primes=("${primes[@]}" true)
	done

	for (( i=2; i<=$(sqrt $range); i++ ))
	do		
		if ( ${primes[$i]} )
			then			
			for (( j=$(($i * $i)); j<=$range; j=$(($j + $i)) ))
			do
				primes[$j]=false
			done
		fi
	done
	
	res=()
	for (( i=2; i<=$range; i++ ))
	do
		if ( ${primes[$i]} )
			then
			res=("${res[@]}" $i)
		fi
	done

	echo ${res[@]}
}
