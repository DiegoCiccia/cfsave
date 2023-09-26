cap program drop cfsave
program define cfsave, rclass
syntax varlist using/ [, saveopt(string) cfopt(string)]
qui {
    if !fileexists("`using'") {
        noi save `using', `saveopt'
    }
    else {
        noi cf `varlist' using `using', `cfopt'  
        if _rc == 0 {
            noi save `using', `saveopt'
        }
    }
}
end