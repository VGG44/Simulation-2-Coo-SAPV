function out = extract_cell_arrays(year)
    out = {};
    for m = 1:numel(year)
        if iscell(year{m})
            out = [out extract_cell_arrays(year{m})];
        else
            out = [out year{m}];
        end
    end
end