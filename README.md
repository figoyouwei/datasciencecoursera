check on new Mac Mavericks

14/07/19: Install MySQL on Mac Mavericks OS Version 10.9.4
----------

1. Install from App Store XCode if it is not default on the new Mac.
After installing, which normally starts automatically after downloading ... 
>>$ xcode-select -p (it shall give a valid path as below:)
/Applications/Xcode.app/Contents/Developer

2. Install homebrew using this command. Your mac shall have a password, otherwise won't work well.
After installing, you shall see:
==> Installation successful!
==> Next steps
Run `brew doctor` before you install anything
Run `brew help` to get started
>>$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

3. Install MySQL via homebrew
>>$ brew install mysql
To verify that the installation is successful by connecting to the UCSC MySQL.
>>$ mysql --user=genome --host=genome-mysql.cse.ucsc.edu -A

4. Install RMySQL within R
> Sys.setenv(PKG_CPPFLAGS = "-I/usr/local/include/mysql")
> Sys.setenv(PKG_LIBS = "-L/usr/local/lib -lmysqlclient")
> install.packages("RMySQL", type="source")
> library(RMySQL)

