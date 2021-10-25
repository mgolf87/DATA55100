function [ DataSets ] = LoadDataSets( )

    DataSets = {};

    D = dir('*.PGM');
    
    for i=1:length(D)
    
        X = MakeDataSet( D(i).name );
        DataSets{i} = X;
        
    end

end