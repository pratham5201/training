module Addbooks
    $bookdata = Hash.new
    def add()
        print "Enter the book id "
        id = gets.chomp.to_i
        print 'Enter book name '
        name=gets.chomp
        print 'Enter book Author '
        author = gets.chomp
        $bookdata[id] = [name,author,"UnIssued"]
        File.open("bookdata.txt","a") do |file|
            file.write("\n")
            file.write($bookdata)
            p " data added successfuly"
            Library.lib
        end
    end
end


module Viewbooks
    def data()
        File.open("bookdata.txt","r") do |file|
        file.each do |line|
            print line
        end
        end
        Library.lib
    end
end


module Deletebook
    def Delete()
        print "Enter the Book id"
        id=gets.chomp.to_i
        f = File.new("bookdata.txt", 'r+')
        x=101
        
        f.each do |line|
        if  x==id
             # seek back to the beginning of the line.
             f.seek(-line.length, IO::SEEK_CUR)
             # overwrite line with spaces and add a newline char
             f.write(' ' * (line.length - 1))
             f.write("\n")
        
         end
         x+=1
    end
    Library.lib
end
end

module Editbook
    def edit
        print "Enter the book id "
        id=gets.chomp.to_i
        f = File.new("bookdata.txt", 'r+')
        x=101
        f.each do |line|
        if  x==id
            linedata=line
        # seek back to the beginning of the line.
        f.seek(-line.length, IO::SEEK_CUR)
        # overwrite line with spaces and add a newline char
        f.write('' * (line.length - 1))
            puts line
            print 'Enter new book name '
            name=gets.chomp
            print 'Enter book Author '
            author = gets.chomp
            print 'Enter  book status'
            status = gets.chomp
            $bookdata[x] = [name,author,status]
            f.write($bookdata)
            print "data updated=#{$bookdata}"
        end
        x+=1
        end
        Library.lib
        end
end

module Issuebook
    def issue
        print "Enter book id "
        id=gets.chomp.to_i
        f = File.new("bookdata.txt", 'r+')
        x=101
        f.each do |line|
        if  x==id
            l=line.delete(" \ ")
            p l
            fline =line.split("\"")
            if fline[5]=="Issued"
                p "Book already been Issued"
            elsif fline[5]=="UnIssued"
                print "Do you realy wanna essue this book Y/N"
                i=gets.chomp
                if i=="y"
                    fline[5]="Issued"
                    $bookdata[id] = [fline[1],fline[3],fline[5]]
                    # seek back to the beginning of the line.
                    f.seek(-line.length, IO::SEEK_CUR)
                    # overwrite line with spaces and add a newline char
                    f.write($bookdata)
                    p "Book Issued "
                else
                    lib()
                end
            end
        end
        x+=1
        end
        Library.lib
        end        
end

module Returnbook
    def retn
        print "Enter book id "
        id=gets.chomp.to_i
        f = File.new("bookdata.txt", 'r+')
        x=101
        f.each do |line|
        if  x==id
            l=line.delete(" \ ")
            p l
            fline =line.split("\"")
            if fline[5]=="Issued"
                print "Do you wanna return this book Y/N"
                i=gets.chomp
                if i=="y"
                    fline[5]="UnIssued"
                    $bookdata[id] = [fline[1],fline[3],fline[5]]
                    # seek back to the beginning of the line.
                    f.seek(-line.length, IO::SEEK_CUR)
                    # overwrite line with spaces and add a newline char
                    f.write($bookdata)
                    p "Book Returned "
                else
                    lib()
                end
            end
        end
        x+=1
        end
        Library.lib
    end
end



module Library
    def lib
        puts "                    Wellcome to library"
        puts "-------------------------------------------------------------"
        puts "'A' to Add books to library"
        puts "'V' to View  books in the library"
        puts "'D' to Delete a books from library"
        puts "'E' to edit a book in the library"
        puts "'I' to  Issue a book"
        puts "'R' to retrun a book"
        print "Select any option from above list: "
        ua=gets.chomp.downcase
        puts "-------------------------------------------------------------"
        if ua=="a"
            include Addbooks
            add()
        elsif ua=="v"
            include Viewbooks
            data()
        elsif ua=="d"
            include Deletebook
            Delete()

        elsif ua=="e"
            include Editbook
            edit
        elsif ua=="i"
            include Issuebook
            issue
        elsif ua=="r"
            include Returnbook
            retn
        else
            p "Inlvalid operation"
        end
        Library.lib
    end
end
