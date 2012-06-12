    #!/usr/bin/perl

    use strict;
    use warnings;

    my $dir = '../web';
	my $file = 'executePerl.bat';
	my $str = qq~cd ..\\web\\\n~;
    opendir(DIR, $dir) or die $!;

    while (my $file = readdir(DIR)) {

        # Only generate for .pl files
        if ($file =~ m/.*pl/)
		{
				$str = $str."perl $file\n"
		}
    }

    closedir(DIR);
	
	open my $file_fh, ">$file" or die "can't open file: $!\n";
	print $file_fh $str;
	close $file_fh;
    exit 0;