#!/usr/bin/perl

# Set these for your situation
my $MTDIR = "/home/stkowner/install/";
my $BACKUPDIR = "/home/stkowner/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "1.0";

print "STKBackup.pl version $VERSION\n";
print "========================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/stkbackup-5.tgz")
{
	unlink("$BACKUPDIR/stkbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/stkbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/stkbackup-4.tgz")
{
	rename("$BACKUPDIR/stkbackup-4.tgz", "$BACKUPDIR/stkbackup-5.tgz");
}
if (-f "$BACKUPDIR/stkbackup-3.tgz")
{
	rename("$BACKUPDIR/stkbackup-3.tgz", "$BACKUPDIR/stkbackup-4.tgz");
}
if (-f "$BACKUPDIR/stkbackup-2.tgz")
{
	rename("$BACKUPDIR/stkbackup-2.tgz", "$BACKUPDIR/stkbackup-3.tgz");
}
if (-f "$BACKUPDIR/stkbackup-1.tgz")
{
	rename("$BACKUPDIR/stkbackup-1.tgz", "$BACKUPDIR/stkbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/stkbackup-1.tgz $MTDIR");
print("Done!\n");
exit 0;
