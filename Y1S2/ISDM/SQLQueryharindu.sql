

--------Hotel reservation Management System --------


--------Administrator Table --------
CREATE TABLE Administrator (
    AdminID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO Administrator (AdminID, FirstName, LastName, Email)
VALUES ('001', 'Peterson', 'Andrew', 'petersonandrew@gmail.com');






--------Hotel Provider Table --------
CREATE TABLE Hotel_Provider (
    ProviderID INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO Hotel_Provider (ProviderID, FirstName, LastName, Email)
VALUES 
    ('101', 'John', 'Doe', 'johndoe@example.com'),
    ('102', 'Alice', 'Smith', 'alice.smith@example.com'),
    ('103', 'Michael', 'Johnson', 'michael.johnson@example.com'),
    ('104', 'Emily', 'Brown', 'emily.brown@example.com'),
    ('105', 'David', 'Martinez', 'david.martinez@example.com');






--------Manager Table --------
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO Manager (ManagerID, FirstName, LastName, Email)
VALUES ('101', 'David', 'Miller', 'davidmiller@gmail.com');





--------Marketing Manager Table --------
CREATE TABLE MarketingManager (
    MManagerID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

INSERT INTO MarketingManager (MManagerID, FirstName, LastName, Email)
VALUES ('201', 'Calvin', 'Klein', 'calvinklein@gmail.com');



--------Tourist Table --------
CREATE TABLE Tourist (
    UserID INT NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    AdminID INT NOT NULL,
    CONSTRAINT TouristPK PRIMARY KEY (UserID),
    CONSTRAINT TouristAdminFK FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID)
);

INSERT INTO Tourist (UserID, FirstName, LastName, Address, Age, Email, Username, Password, AdminID)
VALUES 
    ('001', 'Shane', 'Watson', '1/23 Main Street, Mel', '25', 'shanewatson@gmail.com', 'shane.watson', 'password', '001'),
    ('002', 'Amal', 'Jackson', '456 Kottawa, Colombo', '23', 'amaljackson@gmail.com', 'samal.jackson', 'password', '001'),
    ('003', 'Kamal', 'Wayne', '110 Malabe', '28', 'kamalwayne@gmail.com', 'kamal.wayne', 'password', '001'),
    ('004', 'Peter', 'Perera', '2090 Ratnapura', '26', 'peterperera@gmail.com', 'speter.perera', 'password', '001'),
    ('005', 'Vinuji', 'Fernando', '1/40 Kuruwita', '30', 'vinujifernando@gmail.com', 'vinuji.fernando', 'password', '001');



--------Package Table --------
CREATE TABLE Package_ (
    PackageID INT NOT NULL,
    PackageName VARCHAR(255) NOT NULL,
    Description_ VARCHAR(255) NOT NULL,
    Availability_ VARCHAR(255) NOT NULL,
    ProviderID INT NOT NULL,
    ManagerID INT NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT Package__PK PRIMARY KEY (PackageID),
    CONSTRAINT packagemanagerFK FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID),
    CONSTRAINT packagetouristFK FOREIGN KEY (UserID) REFERENCES Tourist (UserID),
    CONSTRAINT packackageproviderFK FOREIGN KEY (ProviderID) REFERENCES Hotel_Provider (ProviderID)
);

INSERT INTO Package_ (PackageID, PackageName, Description_, Availability_, ProviderID, ManagerID, UserID)
VALUES 
    ('01', '2 person', '2 persons per day with a double bed 12h', 'Available', '101', '101', '001'),
    ('02', '3 person', '3 persons per day with 3 single beds 12h', 'Available', '102', '101', '002'),
    ('03', 'One day', 'Single room for one day 24h', 'Not Available', '103', '101', '003'),
    ('04', 'One day 2 person', 'Single room for one day 24h with a double bed', 'Available', '104', '101', '004'),
    ('05', 'Air conditioned', 'Air conditioned room with a king-size bed', 'Not Available', '105', '101', '005');







--------Booking Table --------
CREATE TABLE Booking (
    BookingID INT NOT NULL,
    UserID INT NOT NULL,
    PackageID INT NOT NULL,
    BookingDate DATE NOT NULL,
    PaymentStatus VARCHAR(255) NOT NULL,
    ManagerID INT NOT NULL,
    CONSTRAINT bookingPK PRIMARY KEY (BookingID),
    CONSTRAINT bookingmanagerFK FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID),
    CONSTRAINT bookingtouristFK FOREIGN KEY (UserID) REFERENCES Tourist (UserID),
    CONSTRAINT bookingpackageFK FOREIGN KEY (PackageID) REFERENCES Package_ (PackageID)
);

INSERT INTO Booking (BookingID, UserID, PackageID, BookingDate, PaymentStatus, ManagerID)
VALUES 
    ('0001', '001', '01', '2024-05-02', 'Payment successful', '101'),
    ('0002', '002', '02', '2024-05-01', 'Payment successful', '101'),
    ('0003', '003', '03', '2024-04-28', 'Payment successful', '101'),
    ('0004', '004', '04', '2024-05-03', 'Payment successful', '101'),
    ('0005', '005', '05', '2024-05-03', 'Payment successful', '101');





--------Support_inquery Table --------
CREATE TABLE Support_inquery (
    InquiryID INT NOT NULL,
    UserID INT NOT NULL,
    InqueryText VARCHAR(255) NOT NULL,
    InqueryDate DATE NOT NULL,
    InqueryStatus VARCHAR(255) NOT NULL,
    CONSTRAINT Support_inquery_PK PRIMARY KEY (InquiryID),
    CONSTRAINT Support_inquery_User_FK FOREIGN KEY (UserID) REFERENCES Tourist (UserID)
);

INSERT INTO Support_inquery (InquiryID, UserID, InqueryText, InqueryDate, InqueryStatus)
VALUES 
    ('1', '001', 'How can I reset my password?', '2024-05-02', 'Pending'),
    ('2', '002', 'I am having trouble accessing my account.', '2024-05-01', 'Resolved'),
    ('3', '003', 'I need assistance with my recent order.', '2024-04-30', 'Pending'),
    ('4', '004', 'My payment is not going through.', '2024-04-29', 'Open'),
    ('5', '005', 'I would like to change my subscription plan.', '2024-04-28', 'Open');




--------Support Response Table --------
CREATE TABLE Response_ (
    ResponseID INT NOT NULL,
    UserID INT NOT NULL,
    InquiryID INT NOT NULL,
    ResponseText VARCHAR(255) NOT NULL,
    ResponseDate DATE NOT NULL,
    CONSTRAINT Response_PK PRIMARY KEY (ResponseID),
    CONSTRAINT Response_User_FK FOREIGN KEY (UserID) REFERENCES Tourist (UserID),
    CONSTRAINT Response_Inquiry_FK FOREIGN KEY (InquiryID) REFERENCES Support_inquery (InquiryID)
);

INSERT INTO Response_ (ResponseID, UserID, InquiryID, ResponseText, ResponseDate)
VALUES 
    ('1', '001', '1', 'Your password has been reset successfully.', '2024-05-03'),
    ('2', '002', '2', 'We have resolved the issue with your account access.', '2024-05-02'),
    ('3', '003', '3', 'Our team is currently working on resolving your order issue.', '2024-05-01'),
    ('4', '004', '4', 'Please check your payment details and try again.', '2024-04-30'),
    ('5', '005', '5', 'We have updated your subscription plan as requested.', '2024-04-29');



--------Feedback Table --------
CREATE TABLE Feedback_ (
    FeedbackID INT NOT NULL,
    UserID INT NOT NULL,
    FeedbackText VARCHAR(255) NOT NULL,
    FeedbackDate DATE NOT NULL,
    ResponseID INT NOT NULL,
    CONSTRAINT Feedback_PK PRIMARY KEY (FeedbackID),
    CONSTRAINT feedbacktouristFK FOREIGN KEY (UserID) REFERENCES Tourist (UserID),
    CONSTRAINT feedbackresponseIDFK FOREIGN KEY (ResponseID) REFERENCES Response_ (ResponseID)
);

INSERT INTO Feedback_ (FeedbackID, UserID, FeedbackText, FeedbackDate, ResponseID)
VALUES 
    ('101', '001', 'Thank you for your feedback!', '2024-05-03', '1'),
    ('102', '002', 'We apologize for the inconvenience.', '2024-04-23', '2'),
    ('103', '003', 'Your suggestions have been noted.', '2024-05-01', '3'),
    ('104', '004', 'We appreciate your input.', '2024-05-02', '4'),
    ('105', '005', 'Please contact us for further assistance.', '2024-04-28', '5');



--------Payment Table --------
CREATE TABLE Payments__ (
    PaymentID INT NOT NULL,
    UserID INT NOT NULL,
    PackageID INT NOT NULL,
    PaymentAmount VARCHAR(255) NOT NULL,
    PaymentMethod VARCHAR(255) NOT NULL,
    PaymentDate DATE NOT NULL,
    ManagerID INT NOT NULL,
    CONSTRAINT Payments__PK PRIMARY KEY (PaymentID),
    CONSTRAINT paymentmanagerFK FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID),
    CONSTRAINT paymenttouristFK FOREIGN KEY (UserID) REFERENCES Tourist (UserID),
    CONSTRAINT paymentpackageFK FOREIGN KEY (PackageID) REFERENCES Package_ (PackageID)
);

INSERT INTO Payments__ (PaymentID, UserID, PackageID, PaymentAmount, PaymentMethod, PaymentDate, ManagerID)
VALUES 
    ('00001', '001', '01', '46000.00', 'Online', '2024-05-02', '101'),
    ('00002', '002', '02', '40000.00', 'Online', '2024-05-01', '101'),
    ('00003', '003', '03', '42000.00', 'Bank Payment', '2024-04-28', '101'),
    ('00004', '004', '04', '38000.00', 'Online', '2024-05-03', '101'),
    ('00005', '005', '05', '37000.00', 'Bank Payment', '2024-05-03', '101');




--------Report Table --------
CREATE TABLE Report_ (
    ReportID INT NOT NULL,
    ReportDate DATE NOT NULL,
    ManagerID INT NOT NULL,
    AdminID INT NOT NULL,
    CONSTRAINT Report_PK PRIMARY KEY (ReportID),
    CONSTRAINT reportmanagerFK FOREIGN KEY (ManagerID) REFERENCES Manager (ManagerID),
    CONSTRAINT reportadministratorFK FOREIGN KEY (AdminID) REFERENCES Administrator (AdminID)
);

INSERT INTO Report_ (ReportID, ReportDate, ManagerID, AdminID)
VALUES 
    ('1', '2024-05-02', '101', '001'),
    ('2', '2024-05-01', '101', '001'),
    ('3', '2024-04-30', '101', '001'),
    ('4', '2024-04-29', '101', '001'),
    ('5', '2024-04-28', '101', '001');


--payment and booking table--
CREATE TABLE PaymentBooking (
    PaymentID INT NOT NULL,
    BookingID INT NOT NULL,
    CONSTRAINT PaymentBooking_PK PRIMARY KEY (PaymentID, BookingID),
    CONSTRAINT PaymentBooking_Payment_FK FOREIGN KEY (PaymentID) REFERENCES Payments__ (PaymentID),
    CONSTRAINT PaymentBooking_Booking_FK FOREIGN KEY (BookingID) REFERENCES Booking (BookingID)
);

INSERT INTO PaymentBooking (PaymentID, BookingID)
VALUES 
    ('00001', '0001'),
    ('00002', '0002'),
    ('00003', '0003'),
    ('00004', '0004'),
    ('00005', '0005');



--package and booking table--
CREATE TABLE PackageBooking (
    PackageID INT NOT NULL,
    BookingID INT NOT NULL,
    CONSTRAINT PackageBooking_PK PRIMARY KEY (PackageID, BookingID),
    CONSTRAINT PackageBooking_Package_FK FOREIGN KEY (PackageID) REFERENCES Package_ (PackageID),
    CONSTRAINT PackageBooking_Booking_FK FOREIGN KEY (BookingID) REFERENCES Booking (BookingID)
);

INSERT INTO PackageBooking (PackageID, BookingID)
VALUES 
    ('01', '0001'),
    ('02', '0002'),
    ('03', '0003'),
    ('04', '0004'),
    ('05', '0005');
