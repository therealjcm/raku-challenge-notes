# initial approach
gather for (2..^9) { .take if .is-prime }
.combinations.grep( {.sum == 9} )
.sort( {$^a.elems > $^b.elems } ).first.elems

# using arg to combination to restrict number of combinations generated
gather for (2..^5000) { .take if .is-prime }
.combinations(2).grep( {.sum == 5000} )
.first.elems;

# cross product pairs approach
my @p = gather for (2..^5000) { .take if .is-prime };
my @cross-pairs = (@p X @p).grep( {.[0] <= .[1]} };
@cross-pairs.grep( {.sum == 5000} ).first.elems;
