data = CSV.read("dataset.csv", DataFrames.DataFrame);
function kNN(k, inputData)
    eucliddist = []
    for row in eachrow(data)
        distance = euclidean(inputData,row[1:6])
        append!(eucliddist,[[distance,row[7]]])
    end
    sort!(eucliddist)
    norm = 0
    abnorm = 0
    for i = 1:k
        if eucliddist[i][2] == "Abnormal"
            abnorm +=1
        elseif eucliddist[i][2] == "Normal"
            norm +=1
        end
    end
    if abnorm > norm
        return "Abnormal"
    else
        return "Normal"
    end
end