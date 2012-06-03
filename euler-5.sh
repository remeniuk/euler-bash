# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
. math.sh

array_mult() {
	mult=1
	array=$@
	for i in ${array[@]}
	do
		mult=$(($mult * $i))
	done
	echo $mult
}

is_evenly_divisable() {
	range=$1
	target=$2
	
	for (( i=$range; i>=1; i-- ))
	do
		if [[ $(($target % $i)) > 0 ]]
			then
			return 1
		fi
	done
	return 0
}

find_evenly_divisable() {
	range=$1
	target=$(array_mult $(filter_primes $range))
	result=
	for (( i=1; ; i++ ))
	do
		if ( is_evenly_divisable $range $(($target * $i)) )
			then
			result=$(($target * $i))
			break;
		fi	
	done	
	echo $result
}

find_evenly_divisable 20