
class AppwriteConstants {

static const String endpoint = 'https://cloud.appwrite.io/v1';

static const String projectId ="658d7b3746ed317621f8";

static const String projectdatabases = "6590195d531aba5f060f";

static const String usercollection = "659550725998138f3693";

static const String postCollection = "659f02bdf3261e522e7e";

static const String storageBucket =  'postimage';

static String imageslinks (String id) => '$endpoint/storage/buckets/$storageBucket/files/$id/view?project=$projectId&mode=admin';

static String commentsCollection = '65cdd6d9c9f9bd1c208e' ;

}
