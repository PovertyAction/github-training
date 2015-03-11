* Compare the variables region-no_good_at_all of the datasets firstEntry.dta and
* secondEntry.dta, using variable uniqueid to match observations
use firstEntry
cfout region-no_good_at_all using secondEntry, id(uniqueid)

* Save the differences to the file diffs.dta
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs)
use diffs

* Save the differences dataset with alternative variable names
use firstEntry
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, variable(varname) masterval(master_value) usingval(using_value) replace)
use diffs

* Save all comparisons to the differences dataset, not just differences
use firstEntry
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, all replace)
use diffs
count if diff

* Add variable deo from firstEntry.dta to the differences dataset
use firstEntry
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, keepmaster(deo) replace)
use diffs

* Save the storage types of the compared variables as an additional variable of the
* differences dataset
use firstEntry
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, properties(type) replace)
use diffs
generate isstrvar = strmatch(type, "str*")

* Save the storage types of the compared variables with an alternative variable name
use firstEntry, clear
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, properties(type(storage_type)) replace)
use diffs

* For data that has been entered twice, compare the first and second entries, calculating
* discrepancy rates for each pair of data entry operators.  This yields the same results as
* the SSC program cfby.
use firstEntry
* Variable deo identifies the data entry operator.
rename deo deo1
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diffs, all keepmaster(deo1) keepusing(deo) replace)
use diffs, clear
rename deo deo2
generate swap = deo1 > deo2
generate t = deo1 if swap
replace deo1 = deo2 if swap
replace deo2 = t if swap
drop swap t
bysort deo*: generate total = _N
by deo*: egen total_diff = total(diff)
by deo*: generate error_rate = 100 * total_diff / total
format error_rate %9.2f
sort deo*
egen tag = tag(deo*)
list deo* total_diff total error_rate if tag, abbreviate(32) noobs

* For twice entered data and a list of correct values, determine the error rates of
* individual data entry operators (not pairs as above)
use firstEntry, clear
readreplace using correctedValues.csv, id(uniqueid) variable(question) value(correctvalue)
cfout region-no_good_at_all using firstEntry,  id(uniqueid) saving(diff1, all keepusing(deo))
cfout region-no_good_at_all using secondEntry, id(uniqueid) saving(diff2, all keepusing(deo))
use diff1, clear
append using diff2
bysort deo: generate total = _N
by deo: egen total_diff = total(diff)
by deo: generate error_rate = 100 * total_diff / total
format error_rate %9.2f
sort deo
egen tag = tag(deo)
list deo total_diff total error_rate if tag, abbreviate(32) noobs
