const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.deleteUser = functions.https.onCall(async (data, context) => {
  // Perform authentication checks here

  const email = data.email;
  try {
    const userRecord = await admin.auth().getUserByEmail(email);
    const userId = userRecord.uid;

    // Delete the user from Firebase Authentication
    await admin.auth().deleteUser(userId);

    // Delete the user's data from Firestore
    // Adjust the path to your users collection and document as needed
    await admin.firestore().collection("users").doc(userId).delete();

    return {message: "User deleted successfully"};
  } catch (error) {
    console.error("Error deleting user:", error);
    throw new functions.https.HttpsError("internal", error.message);
  }
});
