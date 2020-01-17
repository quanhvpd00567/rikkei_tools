class Employee < ApplicationRecord

    enum role: [:BrSE, :BrSE_BA , :COMTOR, :DEV, :Dlead, :PM, :TESTER]

    enum level: [:F2, :J1, :J2, :J3, :S1, :S2, :S3, :S4]
end