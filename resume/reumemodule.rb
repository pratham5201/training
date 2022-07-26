PHONE_NUMBER_REGEX = /^\(?[\d]{3}\)?[\s|-]?[\d]{3}-?[\d]{4}$/
EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
DOB_REGEX = /\d{4}-(0[1-9]|1[0-2])-/

module Resume

    def res
        print "Starting"
        for i in 0..120
            print ">"
            sleep(0.005)
        end

        inputList = [
            "Father Name",
            "Gender [M/F]",
            "Address",
            "Languages",
            "Secondary classs%",
            "Senior secondary classs%",
            "College aggregate score",
            "Hobbies",
            "Strengths",
            "Email",
            "contact no.",
            "DOB [yyyy-mm-dd]",
        ]
        print "please enter your name :"
        name=gets.chomp
        file = File.new( "resume#{name}.txt" , "w" )
        for item in inputList
            while(item=="Email")
                print "Enter your #{item} :"
                value=gets.chomp
                if value =~ EMAIL_REGEX
                    fdata=item+ " : " + value
                    file.puts(fdata)
                    break
                else
                    puts "Invalid Email"
                end
            end
            while(item=="contact no.")
                print "Enter your #{item} :"
                value=gets.chomp
                if value =~ PHONE_NUMBER_REGEX                             
                    fdata=item+ " : " + value
                    file.puts(fdata)
                    break
                else
                    puts "Invalid contact number"
                end
            end       
            while(item=="DOB [yyyy-mm-dd]")
                print "Enter your #{item} :"
                value=gets.chomp
                if value =~ DOB_REGEX                            
                    fdata=item+ " : " + value
                file.puts(fdata)
                    break
                else
                    puts "Invalid date of birth formate"
                end
            end
            if item=="Father Name" or item=="Gender [M/F]" or item=="Address" or item=="Languages" or item=="Secondary classs%" or item=="Senior secondary classs%" or item=="College aggregate score" or item=="Hobbies" or item=="Strengths"
                print "Enter your #{item} :"
                value=gets.chomp
                fdata=item+ " : " + value
                file.puts(fdata)
            end
        end
        print "building your resume"
        for i in 0..108
            print ">"
            sleep(0.005)
        end
        print "done...."
    end
end
include Resume
res
