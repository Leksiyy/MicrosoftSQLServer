CREATE FUNCTION IsEven(@number INT)
    RETURNS BIT
AS
BEGIN
    RETURN CASE WHEN @number % 2 = 0 THEN 1 ELSE 0 END
END;
